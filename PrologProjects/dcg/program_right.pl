
%P  ::= K.
%K  ::= begin D; C end
%D  ::= const I = N D' | var I D' | I := N D'
%D' ::= ε | ; D D'
%C  ::= I := E C' | if B then C else C endif C' | while B do C endwhile C' | K C'
%C' ::= ε | ; C C'
%B  ::= true | false | E = E | not B
%E  ::= I E' | N E'
%E' ::= ε | E + E E' | E - E E' | E * E E' | E / E E'
%I  ::= x | y | z | u | v
%N  ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9



program_right_rec(pprog(BLK)) --> k(BLK).

k(pblock(S,DECL,E_STT,COND,E)) --> begin(S), d(DECL), endof_stt(E_STT), c(COND), end(E).

d(pdeclaration(K_WORD,VAR,SGN,NUM,D_D))  --> keyword(K_WORD), i(VAR), sign(SGN), n(NUM), d_dash(D_D) | keyword(K_WORD), i(VAR), d_dash(D_D) | i(VAR), sign(SGN), n(NUM), d_dash(D_D).

d_dash(pddeclaration(EMP,E_STT,DECL,D_D)) --> empty(EMP) | endof_stt(E_STT), d(DECL), d_dash(D_D).
%d_dash(pddeclaration(E_STT,DECL,D_D)) --> endof_stt(E_STT), d(DECL), d_dash(D_D).


c(pcondition(VAR,SGN,EXPR,C_C,K_WORD,BOOL,COND,BLK,IF,THEN,ELSE,ENDIF)) --> i(VAR), sign(SGN), e(EXPR), c_dash(C_C) | ifkey(IF), b(BOOL), thenkey(THEN), c(COND), elsekey(ELSE), c(COND), endifkey(ENDIF), c_dash(C_C) | keyword(K_WORD), b(BOOL), keyword(K_WORD), c(COND), keyword(K_WORD), c_dash(C_C) | k(BLK).

c_dash(pccondition(EMP,E_STT,COND,C_C)) --> empty(EMP) | endof_stt(E_STT), c(COND), c_dash(C_C).
%c(pccondition(E_STT,COND,C_C)) --> endof_stt(E_STT), c(COND), c_dash(C_C).


b(pboolean(BOOL,EXPR,SGN,K_WORD)) --> boolean(BOOL) | e(EXPR), sign(SGN), e(EXPR) | keyword(K_WORD), b(BOOL).

e(pexpression(VAR,E_E,NUM)) --> i(VAR), e_dash(E_E) | n(NUM), e_dash(E_E).

e_dash(peexpression(EMP,EXPR,OPR,E_E)) --> empty(EMP) | e(EXPR), opr(OPR), e(EXPR), e_dash(E_E).
%e_dash(peexpression(EXPR,OPR,E_E)) --> e(EXPR), opr(OPR), e(EXPR), e_dash(E_E).


i(pvariable(VAR)) --> variable(VAR).

n(pnumber(NUM)) --> number(NUM).

begin(pbegin(begin)) --> [begin].
end(pend(end)) --> [end].

endof_stt(pendofstt(;)) --> [;].

keyword(pkeyword(const)) --> [const].
keyword(pkeyword(var)) --> [var].
%keyword(pkeyword(if)) --> [if].
%keyword(pkeyword(then)) --> [then].
%keyword(pkeyword(else)) --> [else].
%keyword(pkeyword(endif)) --> [endif].
keyword(pkeyword(while)) --> [while].
keyword(pkeyword(do)) --> [do].
keyword(pkeyword(endwhile)) --> [endwhile].
keyword(pkeyword(not)) --> [not].

ifkey(pifkey(if)) --> [if].
thenkey(pthenkey(then)) --> [then].
elsekey(pelsekey(else)) --> [else].
endifkey(pendifkey(endif)) --> [endif].



sign(psign(=)) --> [=].
sign(psign(:=)) --> [:=].

empty(pempty(EMP)) --> [].

opr(poperator(+)) --> [+].
opr(poperator(-)) --> [-].
opr(poperator(*)) --> [*].
opr(poperator(/)) --> [/].

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

boolean(pboolean(true)) --> [true].
boolean(pboolean(false)) --> [false].



%test_p(P) :- program_right_rec(P,[begin, const, x, =, 8, ;, var, y, ;, var, z, ;, z, :=, 0, ;, if, x, =, y, +, 2, then, z , := , 5, else, z, :=, 3, endif, ;, while, not, x, =, z, do, z, :=, z, +, 2, endwhile, end], []).

%test_p(P) :- program_right_rec(P,[begin, const, x, =, 8, ;, var, y, ;,var, z,;, z, :=, 0, ;,if, x, =, y, +, 2, then, z , := , 5, else, z, :=, 3, endif, ;,end], []).

test_p(P) :- program_right_rec(P,[begin, const, x, =, 8, ;, var, y, ;, var, z, ;, z, :=, 0, ;, if, x, =, y, +, 2, then, z , := , 5, else, z, :=, 3, endif, ;,end], []).








