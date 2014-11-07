{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf210
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural

\f0\fs24 \cf0 (*Matrix multiplication*)\
fun getHeads ([[],[],[]]) = []|\
	 getHeads ([]) = []|\
	 getHeads (L) = [hd (hd L)] @ getHeads (tl L);\
\
fun removeHeads ([[],[],[]]) = []|\
	 removeHeads ([]) = []|\
	 removeHeads (L) = [tl (hd L)] @ removeHeads (tl L);\
\
fun transp ([[],[],[]]) = []|\
	 transp ([]) = []|\
	 transp (L) = [getHeads L] @ transp (removeHeads L);\
\
transp([[1,2,3],[4,5,6],[7,8,9]]);\
\
\
fun multiply(l,m)=l * m;\
\
fun listmultiply([],[])=0|\
	listmultiply([h],[])=0|\
	listmultiply([],[h])=0|\
	listmultiply([h],[l])=l*h|\
	listmultiply(h::t,p::q)=multiply(h,p)+ listmultiply(t,q);\
\
(*listmultiply([1,2],[5,8]);*)\
\
fun mul([],[])=[]|\
	mul([],M)=[]|\
	mul(L,[])=[]|\
	mul(L,[M])= [listmultiply(L,M)]|\
	mul(L,M::N)=listmultiply(L,M)::mul(L,N);\
\
\
(*mul([1,2],[[5,8],[6,9],[7,0]]);*)\
\
fun matrix_mult([[]],[[]])=[[]]|	\
	matrix_mult(M,[[]])=[[]]|\
	matrix_mult([[]],M)=[[]]|\
	matrix_mult([L],M)=[mul(L,M)]|\
	matrix_mult(P::Q,M)=mul(P,M):: matrix_mult(Q,M);\
\
matrix_mult([[1,0,0],[0,1,0],[0,0,1]], transp([[1,2,3],[4,5,6],[7,8,9]]));\
\
(*matrix_mult([[1,2],[3,4]], transp([[5,6,7],[8,9,0]]));*)\
}