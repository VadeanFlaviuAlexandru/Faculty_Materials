x = linspace(0, 6, 13);
f = @(x) exp(sin(x));
fx = f(x);

plot(x,f(x),'*')
hold on;

x2 = linspace(0, 6, 100);

plot(x2,f(x2),'r')
hold on;

rez = Newtonn(x, fx, x2);
plot(x2, rez, 'b')
Write to 813
