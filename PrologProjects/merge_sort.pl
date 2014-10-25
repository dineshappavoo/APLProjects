
%Divide the list
divide([],[],[]).
divide([X],[X],[]).
divide([X,Y|T],[X|M],[Y|N]) :-  divide(T,M,N).

%Merge lists
merge_lists(X,[],X).
merge_lists([],Y,Y).
merge_lists([X|A],[Y|B],[X|C]) :-  X =< Y, merge_lists(A,[Y|B],C).
merge_lists([X|A],[Y|B],[Y|C]) :-  X > Y,  merge_lists([X|A],B,C).


% Merge sort implementation
mergesort([],[]).
mergesort([A],[A]).
mergesort([A,B|R],S) :- divide([A,B|R],X,Y), mergesort(X,P), mergesort(Y,Q), merge_lists(P,Q,S).