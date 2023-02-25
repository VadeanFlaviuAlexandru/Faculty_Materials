clear;
clc;


[x,y]=ginput(5)
xx=min(x):(max(x)-min(x))/100:max(x)
yy=spline(x,y,xx)

plot(x,y,'o',xx,yy)

plot (x,y,'b o',xx,yy,'b -');