x=-1:0.1;1;
p='Please enter a number:';
n=input(p);
T0=1;
plot(x,T0);
hold on;
T1=x;
plot(x,T1);
hold on;
for i = 1:n
  T2=2*x.*T1-T0;
  plot(x,T1);
  hold on;
  T0=T1;
  T1=T2;
end

