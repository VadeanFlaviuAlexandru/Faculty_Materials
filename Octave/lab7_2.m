clear;
clc;

x = [0 10 20 30 40 60 80 100];
y = [0.0061 0.0123 0.0234 0.0424 0.0738 0.1992 0.4736 1.0133];

P1 = polyfit(x, y, 2);
P2 = polyfit(x, y, 7);

plot(x, y, 'x');

hold on;

x = 0:0.01:100;

plot(x, polyval(P1,x),'r --');

hold on;

plot(x, polyval(P2,x),'g');

hold off;

polyval(P1,45)

polyval(P2,45)
x2=[0 10 20 30 40 45 60 80 100];
y2 =[0.0061 0.0123 0.0234 0.0424 0.095848 0.0738 0.1992 0.4736 1.0133];
polyres=polyval(P2,x2);

E = max(abs(polyres-y2))