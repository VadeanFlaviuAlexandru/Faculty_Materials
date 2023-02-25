function h1=hipii_mean(x1,x2,a,tail)
  n1=length(x1)
  n2=length(x2)
 s1=var(x1)
 s2=var(x2)
z=(mean(x1)-mean(x2))/(sqrt(s1/n1+s2/n2))
c=(s1/n1)/(s1/n1+s2/n2)
n=1/(c^2/(n1-1)+(1-c)^2/(n2-1))
if tail==-1
    h=z<=tinv(a,n)
  elseif tail==0
    h=z<=tinv(a/2,n) || z>=tinv(1-a/2,n)
  else
    h=z>=tinv(1-a,n)
  endif  
endfunction