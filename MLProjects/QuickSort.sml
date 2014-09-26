{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf210
{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural

\f0\fs22 \cf0 \CocoaLigature0 (*Quick Sort implementation in SML*)\
fun sum([])=0|\
	sum([h])=h|\
	sum(h::t)=h+sum(t);\
\
fun length([])=0|\
	length(h::t)=1+length(t);\
\
fun avg(L)=sum(L) div length(L);\
\
fun pivot([],avg,c)=c| \
	pivot([h],avg,c)=c|\
	pivot(h::t,avg,c)= if abs(avg-h) <= abs(avg-c) then pivot(t,avg,h) else pivot(t,avg,c);\
\
fun lessThanPivot([],p)=[]|\
	lessThanPivot([h],p)=if h<p then [h] else []|\
	lessThanPivot(h::t,p)= if h<p then h::lessThanPivot(t,p) else lessThanPivot(t,p);\
\
fun greaterThanPivot([],p)=[]|\
	greaterThanPivot([h],p)=if h>p then [h] else []|\
	greaterThanPivot(h::t,p)= if h>p then h::greaterThanPivot(t,p) else greaterThanPivot(t,p);\
\
\
fun countPivot([],p)=0|\
	countPivot([h],p)=if h=p then 1 else 0|\
	countPivot(h::t,p)=if h=p then 1+ countPivot(t,p) else countPivot(t,p); \
\
(*countPivot([1,2,3,4,5,5,6,7,8,9],5);*)\
\
fun createPivotList(p,0)=[]|\
	createPivotList(p,1)=[p]|\
	createPivotList(p,x)=p::createPivotList(p,x-1);\
\
(*createPivotList(5,countPivot([1,2,3,4,5,5,6,7,8,9],5));*)\
\
fun qSort([])=[]|\
	qSort([h])=[h]|\
	qSort(L)= let \
		val avg=avg(L)\
		val pivot=pivot(L,avg,0)\
		val left=lessThanPivot(L,pivot)\
		val right=greaterThanPivot(L,pivot)\
	in qSort(left)@ createPivotList(pivot,countPivot(L,pivot)) @ qSort(right)\
	end;\
\
qSort([1,9,8,3,4,5,5,6,7,2]);\
qSort [10,4,2,1,7,5,3,6,8,9];\
qSort [10,9,4,5,6];\
qSort [8];\
qSort [];\
}