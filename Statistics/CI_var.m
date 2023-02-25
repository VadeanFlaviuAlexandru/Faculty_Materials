function [m1, m2] = CI_var (x, alpha)
  Mean = mean(x);
  n = length(x);
  s = std(x);
  thi1 = chi2inv(1-alpha/2, n-1);
  thi2 = chi2inv(alpha/2, n-1);
  m1 = ((n-1).*s^2)/thi1;
  m2 = ((n-1).*s^2)/thi2;
endfunction