
%Reverse the list.
revers([H|T],A,REV):-  revers(T,[H|A],REV).
revers([],A,A).

%Generate the parse tree
b(fb(D,B)) --> d(D), b(B).
b(fdec(D)) --> d(D).
d(fdec(0)) --> [0].
d(fdec(1)) --> [1].

%Parse tree evaluation
bsem(fb(D,B),V) :- dsem(D,V1),bsem(B,V2),V is V1 + 2 * V2.
bsem(fdec(D),V) :- dsem(D,V).
dsem(fdec(0),0).
dsem(fdec(1),1).

%Convert binary to decimal number
decimal(L,V) :- revers(L,[],R),b(P,R,[]),bsem(P,V).
decimal1(L,P) :- revers(L,[],R),b(P,R,[]).

%B = fb(  fdec(0),         fb( fdec(1),     fb( fdec(1), fdec(fdec(1))  )         )        ) .
