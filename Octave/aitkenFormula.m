function retval = aitkenFormula(x, f, x0)
  if (length(x) != length(f))
    error("Incomplete sample points");
  endif
  
  n = length(x);
  D = x - x0;
  A(:,1) = f;
  
  for i = 2:n
    for j = 2:i
      A(i,j) = (D(i) * A(j-1, j-1) - D(j-1) * A(i, j-1)) / (x(i) - x(j-1));
    end
  end
  
  retval = A(n, n);
endfunction
