clear;
clc;



Time = [1, 2, 3, 4, 5, 6, 7];
Temperature = [13, 15, 20, 14, 15, 13, 10];


[a,b]=lsum(Time, Temperature);
m=size(Time)
m=m(2)
xx=0:0.01:10;

plot(xx,xx*a+b,'r')

hold on;

for i = 1:m
  plot([Time(i), Time(i)], [Temperature(i), Time(i) * a + b],'b --');
  plot(Time(i),Temperature(i),'X g')
  hold on; 
end

hold off;
E = norm(Temperature - a * Time - b) ^ 2
res=a*8+b

function [a, b] = lsum(x, y)
  m=size(x);
  m=m(2);
  a = m * x * y' - sum(x) * sum(y);
  a = a / (m * (x * x') - sum(x) ^ 2);

  b = (x * x') * sum(y) - (x * y') * sum(x);
  b = b / (m * (x * x') - sum(x) ^ 2);
end