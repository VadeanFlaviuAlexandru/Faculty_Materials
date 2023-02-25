clear;
clc;


f = @(x) sin(2 * x);
f1 = @(x) 2 * cos(2 * x);

part = [];
for i = -5 : 10 / 15 : 5
  part = [part i i];
endfor
sample = [
part ;
arrayfun(f, part) ;
arrayfun(f1, part)
];

hermit_f = hermit_interpolation(sample);

fplot(f, [-5 5], 'r');
hold on;
fplot(hermit_f, [-5 5], '--b');
hold off;