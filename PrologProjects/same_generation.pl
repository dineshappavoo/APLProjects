
%Method to get the parent
parent(X,Y) :- mother(X,Y).
parent(X,Y) :- father(X,Y).

%Method to get ancestor
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).


%Method to chaeck they are siblings
sibling(X,Y) :- parent(P,X),  parent(P,Y), not(X=Y).

%Method to check whether they are same generation
same_generation(X,Y) :- parent(A,X), parent(A,Y).
same_generation(X,Y) :- parent(A,X), parent(B,Y), sibling(A,B).
same_generation(X,Y) :- parent(A,X),parent(B,Y),same_generation(A,B),not(X==Y).