clc
B=normrnd(25,5,1,365)
%i
tabulate(B, [0:11]);
%ii
 hist(B,10:45);
 H=hist(B,10:45);
 hold
 plot(10:40,H);
%iii
disp("the mean is: ")
mean(B)
disp("the standard deviation is: ")
std(B)
%iv
disp("the range is: ")
range(B)
disp("the mode is: ")
mode(B)
disp("the median is: ")
median(B)
%v
disp("the quartiles is: ")
quantile(B,[0.25,0.5,0.75])
disp("the interquartile range is: ")
iqr(B)
disp("the outliers is: ")
outlier(B)
%vi
%boxplot(B)