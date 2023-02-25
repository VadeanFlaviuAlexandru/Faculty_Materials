function retval = newton (sample)
  if rows(sample) != 2
    error('The input has to be a matrix with 2 rows, first for points second for values');
  endif
  m = columns(sample) - 1;
  
  tabelDif = tabelDivided(sample);
  
  retval = @(x) sample(2, 1);
  for i = 1 : m
    curr = @(x) 1;
    
    for j = 0 : i - 1
      curr = @(x) curr(x) * (x - sample(1, j + 1));
    endfor
    retval = @(x) retval(x) + curr(x) * tabelDif(1, i);
  endfor
endfunction
