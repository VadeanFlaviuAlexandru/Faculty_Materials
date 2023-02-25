function [m1,m2]=CI_meanU(x, alpha)
    Mean=mean(x);
    n=length(x);
    s=std(x);
    t1=tinv(1-alpha/2,n-1);
    t2=tinv(alpha/2,n-1);
    m1=Mean-t1*(s/sqrt(n));
    m2=Mean-t2*(s/sqrt(n));
endfunction