% SEND + MORE function implementation in pl

solve([S,E,N,D,M,O,R,Y]):-
select(D,[0,1,2,3,4,5,6,7,8,9],B),
select(E,B,R1),
X1 is D+E,
Y is mod(X1,10),
C1 is X1//10,
select(Y,R1,R2),
select(N,R2,R3),
select(R,R3,R4),
X2 is C1+N+R,
E is mod(X2,10),
C2 is X2//10,
select(O,R4,R5),
X3 is C2+E+O,
N is mod(X3,10),
C3 is X3//10,
select(S,R5,R6),
select(M,R6,_),
X4 is S+M+C3,
O is mod(X4,10),
M is X4//10.