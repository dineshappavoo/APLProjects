
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

program(pprog(BLK,DOT)) --> k(BLK), dot(DOT).

k(pblock(START,DECL,E_STT,E)) --> begin(START), d(DECL), endof_stt(E_STT), end(E).

d(pdeclaration(K_WORD,VAR,SGN,VAR_N, E_STT))  --> keyword(K_WORD), i(VAR), sign(SGN), i(VAR_N).


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

variable(pvariable(x)) --> [x].
variable(pvariable(y)) --> [y].
variable(pvariable(z)) --> [z].
variable(pvariable(u)) --> [u].
variable(pvariable(v)) --> [v].

number(pnum(0)) --> [0].
number(pnum(1)) --> [1].
number(pnum(2)) --> [2].
number(pnum(3)) --> [3].
number(pnum(4)) --> [4].
number(pnum(5)) --> [5].
number(pnum(6)) --> [6].
number(pnum(7)) --> [7].
number(pnum(8)) --> [8].
number(pnum(9)) --> [9].





%MAIN TESTING
%==========================================================================

test(P) :- program(P,[begin, var, z, :=, x, ;, end, .], []).
%==========================================================================


