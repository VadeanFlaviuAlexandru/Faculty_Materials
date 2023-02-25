clear;
clc;


T=[0 3 5 8 13];
d=[0 225 383 623 993]
v=[75 77 80 74 72]

cs=spline(T,[75 d 72]);

ppval(cs,10)

cs=spline(T,[0.666 v -0.4]);

ppval(cs,10)