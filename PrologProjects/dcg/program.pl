program(fprog(S,B,E)) --> begin(S),body(B),end(E).
begin(fbegin(begin)) --> [begin].
end(fend(end)) --> [end].
body(fbody(D)) --> declarartion(D).

declarartion(fdecl(K,V,S,V_STT,E)) --> keyword(K),variable(V),sign(S),value_stt(V_STT),end_stt(E) | keyword(K), variable(V), end_stt(E) | variable(V), sign(S), value_stt(V_STT), end_stt(E).

keyword(fkeyword(const)) --> [const].
keyword(fkeyword(var)) --> [var].

variable(fvariable(x)) --> [x].
variable(fvariable(y)) --> [y].
variable(fvariable(z)) --> [z].

sign(fsign(=)) --> [=].
sign(fsign(:=)) --> [:=].

value_stt(fval_stt(N,VAR_VAL_STT)) --> numeral(N) | variable_value_stt(VAR_VAL_STT).

end_stt(fendsign(;)) --> [;].

numeral(fnum(0)) --> [0].
numeral(fnum(1)) --> [1].
numeral(fnum(2)) --> [2].
numeral(fnum(3)) --> [3].
numeral(fnum(4)) --> [4].
numeral(fnum(5)) --> [5].
numeral(fnum(6)) --> [6].
numeral(fnum(7)) --> [7].
numeral(fnum(8)) --> [8].
numeral(fnum(9)) --> [9].

variable_value_stt(fvar_val_stt(V,OP, N)) --> variable(V) | variable(V), opr(OP), variable(V) | variable(V), opr(OP), numeral(N) | numeral(N), opr(OP), variable(V).

opr(foperator(+)) --> [+].
opr(foperator(-)) --> [-].
opr(foperator(*)) --> [*].
opr(foperator(/)) --> [/].

test(P) :- program(P,[begin, const, x, =, 8, ;, var, y, ;, var, z, ;, z, :=, 0, ;, end], []).

