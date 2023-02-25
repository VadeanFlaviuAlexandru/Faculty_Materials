sample = [1 1.5 2 3 4 ; 0 0.17609 0.30103 0.47712 0.60206];

FunctionNewton = newton(sample);
display(FunctionNewton(2.5));
display(FunctionNewton(3.25));

max_error = 0;

for y = 1 : 0.1 : 3.5
  curr_error = abs(log10(y) - FunctionNewton(y));
  if max_error < curr_error
    max_error = curr_error;
  endif
endfor

printf("The Interpolation Error has a maximum value of: %d\n", max_error);