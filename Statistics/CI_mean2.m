function [m1,m2]=CI_mean2(x,a,s)
  s=std(x);
  mn=mean(x);
  n=length(x);
  nrm=tinv(a/2,n-1);
  m1=mn+nrm*s/sqrt(n);
  m2=mn+nrm*s/sqrt(n);
end
 