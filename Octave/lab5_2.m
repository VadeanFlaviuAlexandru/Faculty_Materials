clear;
clc;


sample = [1 1 2 2 ;0 0 0.6931 0.6931 ;1 1 0.5 0.5];


hermit_f = hermit_interpolation(sample);
display(hermit_f(1.5));
display(log(1.5));
display(abs(hermit_f(1.5) - log(1.5)));