function h1=hipi_mean(x1,x2,a,tail)
  n1=length(x1)
  n2=length(x2)
s1=var(x1)
s2=var(x2)
sp=sqrt(((n1-1)*s1+(n2-1)*s2)/(n1+n1-2))
z=(mean(x1)-mean(x2))/(sp*sqrt(1/n1+1/n2))
if tail==-1
    h=z<=tinv(a,n1+n2-1)
  elseif tail==0
    h=z<=tinv(a/2,n1+n2-1) || z>=tinv(1-a/2,n1+n2-1)
  else
    h=z>=tinv(1-a,n1+n2-1)
  endif  
endfunction