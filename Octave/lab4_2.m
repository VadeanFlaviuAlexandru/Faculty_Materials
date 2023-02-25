sample = [1 2 3 4 5 ; 22 23 25 30 28];

FunctionNewton = newton(sample);
#a
printf("The number of pounds expected is: %d \n", FunctionNewton(2.5));
plot(sample(1,:), sample(2,:), '.');
#b
hold on;
plot(1 : 0.01 : 5, arrayfun(FunctionNewton, 1 : 0.01 : 5));
hold off;
