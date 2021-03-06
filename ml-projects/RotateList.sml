{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf210
{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural

\f0\fs22 \cf0 (*Rotate list x times in SML*)\
\
(*Function to find the last element of the list*)\
fun last []=[]|\
    last (h::[])=[h] |\
 last (h::t)=last (t);\
 \
fun length []=0|\
  length(h::t)=1+length(t);\
 \
 fun ListWithoutLast [] =[]|\
  ListWithoutLast ([h]) = [] |\
  ListWithoutLast(h::t) =  h::ListWithoutLast(t); \
 \
fun rotate(h::t, 0) = h::t |\
  rotate([], x) = [] |\
  rotate(h::t, x) = if (length(h::t) < x) then rotate(h::t, length(h::t) - (x mod length(h::t)))\
  else rotate(last(t)@ListWithoutLast(h::t), x - 1);\
\
rotate([1,2,3,4,5],3);}