clear;
clc;



X=[0 pi/2 pi 3*pi/2 2*pi];
f=sin(X);
sin(pi/4)
x=0:0.01:2*pi;
F=sin(x)

plot(x,F,'r');

hold on;

plot (X,f,'b o',x,spline(X,f,x),'b -');

p=spline(X,[0 f 0]);

plot(X,f,'o',x,ppval(p,x),'g -');

ppval(p,pi/4)

