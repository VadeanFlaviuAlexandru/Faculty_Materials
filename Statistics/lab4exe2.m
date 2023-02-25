k=binornd(10,0.5)
x=betarnd(0.5,0.5,1,100)
c=exprnd(1,1,100)
y=c.*x.^k
scatter(log(x),log(y))

xx=log(x)
yy=log(y)

R=corrcoef(log(x),log(y))
a=R*(std(yy)/std(xx))
b=mean(yy)-(a*mean(xx))
fprintf('y=%2.2f*x+%2.2f\n',a,b)
