clf; hold on
x = 0;
y = 0;
X = [];
Y = [];

while x<=1 && x>=0 && y>=0 && y<=1
  axis([0 1 0 1]);
  [x,y] = ginput(1);
  plot(x,y,'*')
  X = [X x];
  Y = [Y y];
endwhile

k = 4
p = @(t) polyval(polyfit(X,Y,k),t);
fplot(p, [0,1]);