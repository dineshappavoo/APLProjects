{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf210
{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural

\f0\fs22 \cf0 \CocoaLigature0 (*Set functions*)\
fun contains([], x)=false|\
	contains([h],x)=if x=h then true else false|\
	contains(h::t,x)=if(x=h) then true else contains(t,x);\
\
(*Disjoint set*)\
fun disjointSet([],[])=[]|\
	disjointSet([],L)=[]|\
	disjointSet([h],L)=if contains(L,h)=true then [] else [h]|\
	disjointSet(h::t,L)=if contains(L,h)=true then disjointSet(t,L) else h::disjointSet(t,L);\
\
\
fun union(L,M)=disjointSet(L,M)@ disjointSet(M,L);\
\
union([1,2,3],[3,2,4,5]);\
\
fun intersection([],[])=[]|\
	intersection([h],[])=[]|\
	intersection([],[h])=[]|\
	intersection(L,[])=[]|\
	intersection([],L)=[]|\
	intersection(h::t,L)=if contains(L,h)=true then h:: intersection(t,L) else intersection(t,L);\
\
\
intersection([1,2,3],[3,2,4,5]);\
\
\
fun setdiff([],[])=[]|\
	setdiff([h],[])=[h]|\
	setdiff([],[h])=[]|\
	setdiff(L,[])=L|\
	setdiff([],M)=[]|\
	setdiff(h::t,M)=if contains(M,h)=true then setdiff(t,M) else h::setdiff(t,M);\
\
setdiff([1,2,3],[3,2,4,5]);\
\
fun subset([],[])=true|\
	subset([h],[])=false|\
	subset([],[h])=true|\
	subset(L,[])=false|\
	subset([h],M)=if contains(M,h)=true then true else false|\
	subset(h::t,M)= if contains(M,h)=true then subset(t,M) else false;\
\
subset([1,2,3],[1,3,2,4,5]);\
\
\
(*Power Set*)\
\
(*Function to add element to the list*)\
fun addElem(l,M)=(l::M);\
\
(*addElem(7,[1,3,2,4,5]);*)\
\
(*Function to add one element to all lists in the lists of lists*)\
fun pset(l,[[]])=[[l],[]]|\
	pset(l,[M])=[[]]@[M]@[addElem(l,M)]|\
	pset(l,P::Q)=([P]@[addElem(l,P)])@pset(l,Q);\
\
(*pset(2,[[],[3]]);*)\
\
(*Testing*)\
[[11,12,13]]@[addElem(7,[1,3,2,4,5])];\
\
(*Function to generate the power set of the list*)\
fun powerset([])=[[]]|\
	powerset([h])=[[h],[]]|\
	powerset(h::t)=pset(h, powerset(t));\
\
powerset([1,2,3]);\
\
}