{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf210
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural

\f0\fs24 \cf0 fun accufib(0, b, i, j, x) = 0|\
  accufib(1, b, i, j, x) = 1 |\
	accufib(a, b, i, j, x) = if (a = b) then x\
	else if b > a then ~1\
	else accufib(a, b+1, i+j, i, i+j);\
\
fun fibonacci(0) = 0 |\
	fibonacci(1) = 1 |\
	fibonacci(n) = accufib(n, 2, 1, 1, 1);\
  \
  \
fibonacci(3);}