clc;
x = 0:0.1:10;
f =  1 + cos(pi.*x) ./ (1 + x);

plot(x, f,'b');
hold on

array1 = linspace(0,10,21);
f2=1 + cos(pi.*array1) ./ (1 + array1);
l=LAGR2(array1,f2,7);

plot(x,l,'r');