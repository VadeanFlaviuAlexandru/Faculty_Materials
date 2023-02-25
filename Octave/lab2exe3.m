x=-1:0.01:3;
f=exp(x);
sum=1;
t=1;
n=input('Give value for n');
plot(x,f,'r')
hold on
for k=1:n
  t=t.*x/k;
  sum=sum+t;
  plot(x,sum)
  hold on
end
