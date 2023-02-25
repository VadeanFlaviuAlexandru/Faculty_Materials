## c)
c=0;
for i=1:500
  x=normrnd(90,5,1,300);
  [m1,m2]=CI_var(x,0.05);
  if (m1<25 && 25<m2)
    c=c+1;
  endif
 end
c/500