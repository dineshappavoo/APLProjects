{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf210
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural

\f0\fs24 \cf0 (*Mileage problem*)\
\
fun total_mile([]) = 0 |\
total_mile(x::y:(int*real)list) = #1(x) + total_mile(y);\
\
fun total_gallon([]) = 0.0 |\
total_gallon(x::y:(int*real)list) = #2(x) + total_gallon(y);\
\
fun milepergal ([]) = (0,0.0,0.0) |\
milepergal(l:(int*real)list)= (total_mile(l),total_gallon(l), real(total_mile(l)) / total_gallon(l));\
\
\
milepergal( [(2,3.0),(5,4.0),(10,10.0)] );\
}