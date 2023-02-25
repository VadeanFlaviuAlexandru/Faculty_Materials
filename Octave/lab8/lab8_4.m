clear;
clc;

a = 1; b = 2;
f = @(x) x .* log(x);
n = 1;
real_value = 0.636294368858383;

while abs(repeated_trapezium(a, b, f, n) - real_value) > 0.0007
    n = n + 1;
end

sprintf('smallest value of n is: %d',n)
sprintf('the approximation is: %.20d', repeated_trapezium(a, b, f, n))