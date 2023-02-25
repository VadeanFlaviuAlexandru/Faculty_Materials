x=[10.00 8.00 13.00 9.00 11.00 14.00 6.00 4.00 12.00 7.00 5.00]
y=[8.04 6.95 7.58 8.81 8.33 9.96 7.24 4.26 10.84 4.82 5.68]
disp("mean x")
mean(x)
disp("mean y")
mean(y)
disp("std x")
std(x)
disp("std y")
std(y)
disp("corrcoef x and y")
corr(x,y)
R=corrcoef(x,y)
%disp("scatter")
%S=scatter(x,y)
%plot(S)

a=R*(std(y)/std(x))
b=mean(y)-(a*mean(x))
fprintf('y=%2.2f*x+%2.2f\n',a,b)

a=[10.00 8.00 13.00 9.00 11.00 14.00 6.00 4.00 12.00 7.00 5.00]
b=[9.14 8.14 8.74 8.77 9.26 8.10 6.13 3.10 9.13 7.26 4.74]

disp("mean x2")
mean(a)
disp("mean y2")
mean(b)
disp("std x2")
std(a)
disp("std y2")
std(b)
disp("corrcoef x2 and y2")
corr(a,b)
R2=corrcoef(a,b)
%disp("scatter")
%S2=scatter(x2,y2)
%plot(S2)

a2=R2*(std(b)/std(a))
b2=mean(b)-(a2*mean(a))
fprintf('y=%2.2f*x+%2.2f\n',a2,b2)

c=[10.00    8.00    13.00    9.00    11.00    14.00    6.00 4.00 12.00    7.00 5.00]
d=[7.46 6.77    12.74    7.11 7.81 8.84 6.08 5.39 8.15 6.42    5.73]

disp("mean x2")
mean(c)
disp("mean y2")
mean(d)
disp("std x2")
std(c)
disp("std y2")
std(d)
disp("corrcoef x2 and y2")
corr(c,d)
R2=corrcoef(c,d)
%disp("scatter")
%S2=scatter(x2,y2)
%plot(S2)

a2=R2*(std(d)/std(c))
b2=mean(d)-(a2*mean(c))
fprintf('y=%2.2f*x+%2.2f\n',a2,b2)

e=[8.00 8.00 8.00 8.00 8.00 8.00 8.00    19.00 8.00 8.00    8.00]
f=[6.58 5.76 7.71 8.84 8.47 7.04 5.25    12.50 5.56 7.91    6.89]

disp("mean x2")
mean(e)
disp("mean y2")
mean(f)
disp("std x2")
std(e)
disp("std y2")
std(f)
disp("corrcoef x2 and y2")
corr(e,f)
R2=corrcoef(e,f)
%disp("scatter")
%S2=scatter(x2,y2)
%plot(S2)

a2=R2*(std(f)/std(e))
b2=mean(f)-(a2*mean(e))
fprintf('y=%2.2f*x+%2.2f\n',a2,b2)


subplot(2,2,1)
scatter(x,y)
subplot(2,2,2)
scatter(a,b)
subplot(2,2,3)
scatter(c,d)
subplot(2,2,4)
scatter(e,f)
