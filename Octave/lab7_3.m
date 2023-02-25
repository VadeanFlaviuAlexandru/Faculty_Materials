clear;
clc;

axis([0, 3, 0, 5])
[x, y] = ginput(10);

P = polyfit(x, y, 2);

plot(x, y,'h');

hold on;

xx = 0:0.01:3

plot(xx, polyval(P, xx))
                                #myColors.(cl{M{1,m-1}(q)+1}),'linewidth',12
hold off;