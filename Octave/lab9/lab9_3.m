clear;
clc;

f = @(x) 100 ./ (x.^2) .* sin(10 ./ x);

x = linspace(1,3,100);
y = f(x);

eps = 10^(-4);
a = 1;
b = 3;

% plot
plot(x, y);