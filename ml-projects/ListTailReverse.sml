{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf210
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural

\f0\fs24 \cf0 (*Tail Reverse and other functions*)\
\
fun tailreverse([], p) = p |\
tailreverse(x::t, p)= tailreverse(t,x::p);\
\
\
fun reverse(l) = tailreverse(l, [])\
\
fun reverse(l) = lreverse(l, []);\
\
reverse([8,7,6,5,4]);\
\
fun listsum([], p) = p |\
listsum(x::t, p) = listsum(t, x+p);\
\
fun sum(l)=listsum(l, 0);\
\
sum([4,5,6,3,8]);\
}