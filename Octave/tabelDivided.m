function retval = tabelDivided (M)
  if rows(M) != 2
    error("The input has to be a matrix with 2 rows, first for points second for values");
  endif
  
  l = length(M(1,:));

  for order = 1 : l - 1
    M = [M ; zeros(1, l)];
    row_index = 2 + order;
  
    for i = 1 : l - order
      M(row_index, i) = (M(row_index - 1, i + 1) - M(row_index - 1, i)) / (M(1, i + order) - M(1, i));
    endfor
  endfor
  M = M';
  retval = M(:, 3:end);
endfunction
