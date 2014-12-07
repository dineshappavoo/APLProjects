
%==========================================================================
%                DCG RIGHT RECURSIVE GRAMMAR FOR REFERENCE
%==========================================================================
%P  ::= K.
%K  ::= begin D; C end
%D  ::= const I = N D' | var I D' %| I := N D'
%D' ::= ε | ; D D'
%C  ::= I := E C' | if B then C else C endif C' | while B do C endwhile C' | K C'
%C' ::= ε | ; C C'
%B  ::= true | false | E = E | not B
%E  ::= I := E E' |I E' | N E'
%E' ::= ε | + E E' | - E E' | * E E' | / E E'
%I  ::= x | y | z | u | v
%N  ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9


%==========================================================================
%                    PROGRAM TO GENERATE PARSE TREE
%==========================================================================


program(pprog(K)) --> 	k(K),[.].

k(pblock(D,C)) --> 	[begin],d(D),[;],c(C),[end].

d(DECL) --> d_d(DECL).
d(pdeclaration(D_D,DECL)) --> 	d_d(D_DECL),[;],d(DECL).
d_d(fconst(I,N)) --> [const],i(I),[=],n(N).
d_d(fvar(I)) --> [var],i(I).

c(C) --> 	c_c(C).
c(pcc(C1,C2)) --> 	c_c(C1),[;],c(C2).
c_c(passignie(I,E)) --> 	i(I),[:=],e(E).
c_c(pfullif(B,C1,C2)) --> 	[if],b(B),[then],c(C1),[else],c(C2),[endif].
c_c(pwhile(B,C)) --> [while],b(B),[do],c(C),[endwhile].

e(E) --> e_e(E).
e_e(fi(I)) --> i(I).
e_e(fn(N)) --> n(N).
e_e(fe(E)) --> ['('],e(E),[')'].

e(passign(I,E)) --> i(I),[:=],e(E).
e(padd(E1,E2)) --> e_e(E1),[+],e(E2).
e(psubtract(E1,E2)) --> e_e(E1),[-],e(E2).
e(pmul(E1,E2)) --> e_e(E1),[*],e(E2).
e(fdiv(E1,E2)) --> e_e(E1),[/],e(E2).

b(passignequal(E1,E2)) --> e(E1),[=],e(E2).
b(pnot(B)) --> [not], b(B).
b(pbbrace(B)) --> ['('], b(B),[')'].
b(ptrue(true)) --> [true].
b(pfalse(false)) --> [false].









program(pprog(BLK)) --> k(BLK), [.].

k(pblock(START,DECL,E_STT,E)) --> begin(START), d(DECL), endof_stt(E_STT), end(E).

d(pdeclaration(K_WORD,VAR,SGN,VAR_N))  --> keyword(K_WORD), i(VAR), sign(SGN), i(VAR_N).


i(pvariable(VAR)) --> variable(VAR).

n(pnumber(NUM)) --> number(NUM).

begin(pbegin(begin)) --> [begin].
end(pend(end)) --> [end].
dot(pdot(.)) --> [.].

endof_stt(pendofstt(;)) --> [;].

keyword(pkeyword(const)) --> [const].
keyword(pkeyword(var)) --> [var].

sign(psign(=)) --> [=].
sign(psign(:=)) --> [:=].

empty(pempty(EMP)) --> [].

i(pvariable(x)) --> [x].
i(pvariable(y)) --> [y].
i(pvariable(z)) --> [z].
i(pvariable(u)) --> [u].
i(pvariable(v)) --> [v].
i(pvariable(v)) --> [w].


n(pnum(0)) --> [0].
n(pnum(1)) --> [1].
n(pnum(2)) --> [2].
n(pnum(3)) --> [3].
n(pnum(4)) --> [4].
n(pnum(5)) --> [5].
n(pnum(6)) --> [6].
n(pnum(7)) --> [7].
n(pnum(8)) --> [8].
n(pnum(9)) --> [9].


%==========================================================================
%                    PROGRAM TO GENERATE SEMANTICS
%==========================================================================

%newstore(S).
newstore([(x,0),(y,2),(z,4),(w,2),(m,5)]).

accessval(I,[(I,V) | T],V).
accessval(I,[(J,_) | T ], V) :-  accessval(I, T, V).

access(X,ST,V) :- accessval(X,ST,V).

updateval(I, NV, [(I, V) | T], [(I, NV) | T]).
updateval(I, NV, [(J,V) | T], [(J,V)| T1]) :- updateval(I, NV, T, T1).

update(X,Y,ST, N_ST) :- newstore(ST), updateval(X,Y,ST, N_ST).

psem(pprog(BLK), S, A, B, D) --> newStore(S),
                                 update(x, A, S, S1),
                                 update(y, B, S1, S2),
                                 ksem(BLK, S2, S3),
                                 access(Z, S3, D).


ksem(pblock(CODE), S_IN, S_OUT) --> dsem(CODE, S_IN, S_OUT).

dsem(pdeclaration(VAR,VAR_N), S_IN, S_OUT) --> update(VAR, VAR_N, S_IN, S_OUT).




%MAIN TESTING
%==========================================================================

test(P) :- program(P,[begin, var, z, :=, x, ;, end, .], []).
%==========================================================================


test_sem(P) :- program(P,[begin, var, z, :=, x, ;, end, .], []), write(P), psem(P,S,2,3,Z).


