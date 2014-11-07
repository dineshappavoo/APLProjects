
%Tower of hanoi implementation pl

hanoi(1,A,B,_,[(A,B)]).
hanoi(X,A,B,C,Y):-Z is X-1,hanoi(Z,A,C,B,P),hanoi(1,A,B,_,[Q]),hanoi(Z,C,B,A,R),append(P,[Q|R],Y).