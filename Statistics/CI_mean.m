function [m1,m2]=CI_mean(input1, input2, input3)
    Mean=mean(input1);
    n=length(input1);
    z1=norminv(1-input2/2);
    z2=norminv(input2/2);
    m1=Mean-z1*(input3/sqrt(n));
    m2=Mean-z2*(input3/sqrt(n));
endfunction