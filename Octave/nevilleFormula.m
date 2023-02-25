function retval = nevilleFormula(x, f, x0)
  if (length(x) != length(f))
    error("Incomplete sample points")
  endif
  
  m = length(x) - 1;
  p = zeros(m + 1, m + 1);

  for i = 1 : m + 1 
    p(i,i) = f(i);
  end
  
  for j = 1 : m + 1 
    for i = 1 : m + 1 - j 
      p(i,i+j) = ((x(i+j) - x0) * p(i, i+j-1) - (x(i) - x0) * p(i+1, i+j)) / (x(i+j) - x(i));
    end
  end
  
  retval = p(1 , m + 1);
endfunction