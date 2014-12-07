newstore(S).
newstore([(x,0),(y,2),(z,4),(w,2),(m,5)]).

accessval(I,[(I,V) | T],V).
accessval(I,[(J,_) | T ], V) :-  accessval(I, T, V).

access(X,ST,V) :- accessval(X,ST,V).

updateval(I, NV, [(I, V) | T], [(I, NV) | T]).
updateval(I, NV, [(J,V) | T], [(J,V)| T1]) :- updateval(I, NV, T, T1).

update(X,Y,ST, N_ST) :- newstore(ST), updateval(X,Y,ST, N_ST).


getval(X,V) :- newstore(S),access(X,S,V).

