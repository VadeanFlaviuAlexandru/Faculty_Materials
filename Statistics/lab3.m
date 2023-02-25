clc
A = [ 1 10 6 6 0 9 10 10 8 10 4 2 1 0 9 3 0 0 0 1 8 10 5 10 3 5 0 10 1 3 7 3 1 10 8 0 10 0 6 10 4 7 0 0 0 10 5 10 7 0 10 2 0 7 7 6 10 9 7 7 9 10 3 6 0 8 5 0 7 5 4 6 6 0 3 2 9 10 10 0 9 10 9 4 0 0 0 6 4 3 5 8 2 8 3 10 0 0 3 4 7 10 0 0 9 0 10 6 0 3 9 4 4 4 0 7 10 6 10 0 10 0 4 10 10 10 0 0 10 0 6 2 4 7 0 7 0 10 6 10 3 7 10 0 10 7 6 5 0 0 9 6 7 6 0 7 8 5 9 2 8 3 10 0 6 8 6 0 4 1 0 7 0 0 2 0 2 6 5 8 10 0 10 3 0 0 2 7 9 8 0 8 7 6 7 5 4 2 10 10 2 4 7 7 5 0 1 4 10 10 5 10 10 1 0 10 0 3 6 5 10 0 0 0 10 7 7 10 9 0 3 7 6 10 0 10 7 8 3 0 3 7 10 10 3 0 6 0 4 10 ]
%i
tabulate(A, [0:11]);
%ii
%   hist(A,11);
%   H=hist(A,11);
%   hold
%   plot(0:10,H);
%iii
disp("the mean is: ")
mean(A)
disp("the standard deviation is: ")
std(A)
%iv
disp("the range is: ")
range(A)
disp("the mode is: ")
mode(A)
disp("the median is: ")
median(A)
%v
disp("the quartiles is: ")
quantile(A,[0.25,0.5,0.75])
disp("the interquartile range is: ")
iqr(A)
disp("the outliers is: ")
outlier(A)
%vi
boxplot(A)