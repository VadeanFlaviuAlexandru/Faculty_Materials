function h=hip_mean(x1,x2,s1,s2,a,tail)
  z=(mean(x1)-mean(x2))/sqrt(s1^2/length(x1)+s2^2/length(x2))
  if tail==-1
    h=z<=norminv(a)
  elseif tail==0
    h=z<=norminv(a/2) || z>=norminv(1-a/2)
  else
    h=z>=norminv(1-a)
  endif
endfunction