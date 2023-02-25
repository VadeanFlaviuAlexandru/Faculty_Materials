c=0;
for i=1:500
  ##x=normrnd(90,5,1,300);
  [m1,m2]=CI_mean(x,0.05,5);
  if m1<90 && 90<m2
    c=c+1;
  endif
 end
c/500