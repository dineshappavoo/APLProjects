
%Addition function in pl
plus(0,X,X).
plus(s(X),Y,s(R)):-plus(X,Y,R).

% Multiplication function
times(0,_,0).
times(s(X),Y,R):-times(X,Y,Z),plus(Z,Y,R).

% Factorial function
factorial(0,s(0)).
factorial(s(0),s(0)).
factorial(s(X),Y):-factorial(X,Z),times(s(X),Z,Y).

% Fibonacci function
fibonacci(0,0).
fibonacci(s(0),s(0)).
fibonacci(s(s(X)),Y):-fibonacci(s(X),A),fibonacci(X,B),plus(A,B,Y).