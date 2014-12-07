p(fp(K)) --> 	k(K),[.].

k(fk(D,C)) --> 	[begin],d(D),[;],c(C),[end].

d(D) --> d1(D).
d(fdd(D1,D2)) --> 	d1(D1),[;],d(D2).
d1(fconst(I,N)) --> [const],i(I),[=],n(N).
d1(fvar(I)) --> [var],i(I).

c(C) --> 	c1(C).
c(fcc(C1,C2)) --> 	c1(C1),[;],c(C2).
c1(fie(I,E)) --> 	i(I),[:=],e(E).
c1(fif(B,C1,C2)) --> 	[if],b(B),[then],c(C1),[else],c(C2),[endif].
c1(fwhile(B,C)) --> [while],b(B),[do],c(C),[endwhile].

e(E) --> e1(E).
e1(fi(I)) --> i(I).
e1(fn(N)) --> n(N).
e1(fe(E)) --> ['('],e(E),[')'].
e(fassign(I,E)) --> i(I),[:=],e(E).
e(fadd(E1,E2)) --> e1(E1),[+],e(E2).
e(fsub(E1,E2)) --> e1(E1),[-],e(E2).
e(fmul(E1,E2)) --> e1(E1),[*],e(E2).
e(fdiv(E1,E2)) --> e1(E1),[/],e(E2).

b(fequal(E1,E2)) --> e(E1),[=],e(E2).
b(fnot(B)) --> [not], b(B).
b(fb1(B)) --> ['('], b(B),[')'].
b(ftrue(true)) --> [true].
b(ffalse(false)) --> [false].

i(x) --> [x]. i(y) --> [y]. i(z) --> [z]. i(u) --> [u]. i(v) --> [v]. i(w) --> [w].  

n(0) --> [0]. n(1) --> [1]. n(2) --> [2]. n(3) --> [3]. n(4) --> [4]. n(5) --> [5]. n(6) --> [6]. n(7) --> [7]. n(8) --> [8]. n(9) --> [9].

test1(P):- p(P,[begin, var, z, ; , var, x, ;, z, :=, x, end, .],[]).

test2(P):- p(P,[begin, var, x, ;, var, y, ;, var, z, ;, z, :=, x, +, y, end, .],[]).

test3(P):- p(P,[begin, var, x,;, var, y,;, var, z,;, z,:=,'(',z,:=,x,+,2,')',+,y, end,.],[]).

test4(P):- p(P,[begin, var, x,;, var, y,;, var, z,;,if, x,=,y ,then, z,:=,1 ,else ,z,:=,0 ,endif, end,.],[]).

test5(P):- p(P,[begin, var, x,;, var, y,;, var, z,;, if, x ,= ,0 ,then ,z,:=,x ,else ,z,:=,y ,endif ,end,.],[]).

test6(P):- p(P,[begin, var, x, ;, var, y, ;, var, z, ;, if, not, '(', x, =, y, ')', then, z, :=, x, else, z, :=, y, endif, end, .],[]).

test7(P):- p(P,[begin, var ,x,;, var, z,;, z,:=,0,;, while, not, x,=,0, do, z, :=, z,+,1,;, x,:=,x,-,1, endwhile, end,.],[]).

test8(P):- p(P,[begin, var, x,;, var, y,;, var ,z,;, z,:=,1,;, w,:=,x,;, while ,not ,w, =, 0 ,do, z, :=,z,*,y,;, w,:=,w,-,1, endwhile, end,.],[]).

initialize_store([]).
access(Id,[],0).
access(Id,[(Id,Val)|_],Val).
access(Id,[_|R],Val) :- access(Id,R,Val).
update(Id,NewV,[],[(Id,NewV)]).
update(Id,NewV,[(Id,_)|R],[(Id,NewV)|R]).
update(Id,NewV,[P|R],[P|R1]) :- update(Id,NewV,R,R1).

p_eval(fp(K),X_Val,Y_Val,Output):- 	initialize_store(S1),
									update(x, X_Val, S1, S2), 
									update(y, Y_Val, S2, S3),
									k_eval(K, S3, S4), 
									access(z, S4, Output).
							
k_eval(fk(D,C),Sin,Sout):- 	d_eval(D,Sin,Sin1),
							c_eval(C,Sin1,Sout).

d_eval(fdd(D1,D2),Sin,Sout):- 	d_eval(D1,Sin,Sin1),
								d_eval(D2,Sin1,Sout).
d_eval(fconst(I,N),Sin,Sout):- 	update(I,N,Sin,Sout).
d_eval(fvar(I),Sin,Sin).

c_eval(fcc(C1,C2),Sin,Sout):- 	c_eval(C1,Sin,Sin1),
								c_eval(C2,Sin1,Sout).
c_eval(fie(I,E),Sin,Sout):- e_eval(E,Sin,Sin1,Val),
							update(I,Val,Sin1,Sout).
c_eval(fif(B,C1,C2),Sin,Sout):-	b_eval(B,Sin,Sin1,RV),(RV -> c_eval(C1,Sin1,Sout) ; c_eval(C2,Sin1,Sout)).
c_eval(fwhile(B,C),Sin,Sout):- 	b_eval(B,Sin,Sin1,RV),(RV -> c_eval(C,Sin1,Sin2),c_eval(fwhile(B,C),Sin2,Sout) ; Sout=Sin1).

e_eval(fi(I),Sin,Sin,Val):- access(I,Sin,Val).					
e_eval(fn(N),Sin,Sin,N).
e_eval(fe(E),Sin,Sout,Val):- e_eval(E,Sin,Sout,Val).
e_eval(fassign(I,E),Sin,Sout,Val):- e_eval(E,Sin,Sin1,Val),
									update(I,Val,Sin1,Sout).
e_eval(fadd(E1,E2),Sin,Sout,Val):- 	e_eval(E1,Sin,Sin1,Val1),
									e_eval(E2,Sin1,Sout,Val2), 
									Val is Val1 + Val2.
e_eval(fsub(E1,E2),Sin,Sout,Val):- 	e_eval(E1,Sin,Sin1,Val1),
									e_eval(E2,Sin1,Sout,Val2), 
									Val is Val1 - Val2.
e_eval(fmul(E1,E2),Sin,Sout,Val):- 	e_eval(E1,Sin,Sin1,Val1),
									e_eval(E2,Sin1,Sout,Val2), 
									Val is Val1 * Val2.
e_eval(fdiv(E1,E2),Sin,Sout,Val):- 	e_eval(E1,Sin,Sin1,Val1),
									e_eval(E2,Sin1,Sout,Val2), 
									Val is Val1 / Val2.
									
b_eval(fequal(E1,E2),Sin,Sout,RV):-	e_eval(E1,Sin,Sin1,Val1),
									e_eval(E2,Sin1,Sout,Val2), 
									(Val1=Val2 -> RV = true ; RV = false).
b_eval(fnot(B),Sin,Sout,RV):-	b_eval(B,Sin,Sout,RV1),
								(RV1 -> RV = false ; RV = true).
b_eval(fb1(B),Sin,Sout,RV):-	b_eval(B,Sin,Sout,RV).
b_eval(ftrue(true),_,_,true).
b_eval(ffalse(false),_,_,false).

									
main1(ValX, ValY, A) :- p(P,[begin, var, z, ; , var, x, ;, z, :=, x, end, .],[]),p_eval(P,ValX,ValY,A).

main2(ValX, ValY, A) :- p(P,[begin, var, x, ;, var, y, ;, var, z, ;, z, :=, x, +, y, end, .],[]),p_eval(P,ValX,ValY,A).

main3(ValX, ValY, A) :- p(P,[begin, var, x,;, var, y,;, var, z,;, z, :=, '(', z, :=, x, +, 2, ')', +, y, end, .],[]),p_eval(P,ValX,ValY,A).

main4(ValX, ValY, A) :- p(P,[begin, var, x,;, var, y,;, var, z,;,if, x,=,y ,then, z,:=,1 ,else ,z,:=,0 ,endif, end,.],[]),p_eval(P,ValX,ValY,A).

main5(ValX, ValY, A) :- p(P,[begin, var, x,;, var, y,;, var, z,;, if, x ,= ,0 ,then ,z,:=,x ,else ,z,:=,y ,endif ,end,.],[]),p_eval(P,ValX,ValY,A).

main6(ValX, ValY, A) :- p(P,[begin, var, x, ;, var, y, ;, var, z, ;, if, not, '(', x, =, y, ')', then, z, :=, x, else, z, :=, y, endif, end, .],[]),p_eval(P,ValX,ValY,A).

main7(ValX, ValY, A) :- p(P,[begin, var ,x,;, var, z,;, z,:=,0,;, while, not, x,=,0, do, z, :=, z,+,1,;, x,:=,x,-,1, endwhile, end,.],[]),p_eval(P,ValX,ValY,A).

main8(ValX, ValY, A) :- p(P,[begin, var, x,;, var, y,;, var ,z,;, z,:=,1,;, w,:=,x,;, while ,not ,w, =, 0 ,do, z, :=,z,*,y,;, w,:=,w,-,1, endwhile, end,.],[]),p_eval(P,ValX,ValY,A).