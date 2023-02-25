
n=100;
k=0;
p=0.5;
 
x=random('Binomial',n ,p,[1,1000]);

hist(x)
xx=0:n
X=binopdf(xx,n,p);hold on;
plot(xx,1000*X)

XX=binocdf(xx,n,p);hold on;
plot(xx,1000*XX)

XXX=quantile(X,0.75)
mean(X)
fprintf('sam*%1.3f\n',XXX)