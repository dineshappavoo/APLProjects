
% GSolve trial
gsolve(L1, L2, L3):-
gsolve(L1, L2, L3, [0,1,2,3,4,5,6,7,8,9], 0).

gsolve([H1|T1], [H2|T2], [H3|T3], D, C):-
(   var(H1)
->  select(H1, D, D1)
;   D1 = D
),
(   var(H2)
->  select(H2, D1, D2)
;   D2=D1
),
X1 is H1 + H2 + C,
H3 is mod(X1, 10),
C1 is div(X1, 10),
gsolve(T1, T2, T3, D2, C1).