{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf210
{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural

\f0\fs22 \cf0 (*Bubble Sort*)\
fun length []=0|\
	length(h::t)=1+length(t);\
\
fun sortOnce(L,1)=L|\
  	sortOnce([h],len)=[h]|\
  	sortOnce([],len)=[]|\
  	sortOnce(f::s::t,len)=if f>s then s::sortOnce(f::t,len-1)\
          else f::sortOnce(s::t,len-1);\
\
\
fun last []=[]|\
	last (h::[])=[h] |\
 	last (h::t)=last (t);\
 \
(*length([5,4,3,7,1]);*)\
\
(*sortOnce([5,4,3,7,1],length([5,4,3,7,1])+1);*)\
 \
fun ListWithoutLast [] =[]|\
  	ListWithoutLast ([h]) = [] |\
  	ListWithoutLast(h::t) =  h::ListWithoutLast(t); \
  \
fun sort(L, 0, 0) = [] |\
  sort([h], X, Y) = [h] |\
  sort([], X, Y) = [] |\
	sort(h::t, X, 0) = sort(sortOnce(h::t, length(h::t) + 1), X, 1) |\
	sort(h::t, X, Y) = if X =Y then sortOnce(h::t, length(h::t)+1)@last(t)\
		else sort( sortOnce( ListWithoutLast(h::t), length(h::t)), X, Y+1)@last(t);\
\
fun bubblesort([]) = [] |\
  bubblesort([h]) = [h] |\
	bubblesort(L) = sort(L, length(L)+1, 0);\
\
\
bubblesort [10,4,2,1,7,5,3,6,8,9];\
bubblesort [10,9,4,5,6];\
bubblesort [8];\
bubblesort [];\
\
}