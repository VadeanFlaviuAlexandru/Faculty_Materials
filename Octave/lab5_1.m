clear ; 
clc;

 
sample = [ 0 0 3 3 5 5 8 8 13 13 ;
          0 0 225 225 383 383 623 623 993 993 ;
          75 75 77 77 80 80 74 74 72 72
           ];

hermit_f = hermit_interpolation(sample);
display(hermit_f(10));

plot(sample(1,:), sample(2,:), '.');
hold on;
fplot(hermit_f, [0 13]);
hold off;