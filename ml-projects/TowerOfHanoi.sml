{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf210
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural

\f0\fs24 \cf0 (*Tower of Hanoi problem implementation in SML*)\
fun hanoi(n:int, a, b, c) = if n = 1 then [(a, b)]\
      else hanoi(n-1, a, c, b)@((a, b)::hanoi(n-1, c, b, a));\
\
hanoi(4, 1, 3, 2);\
hanoi(3, 1, 3, 2);}