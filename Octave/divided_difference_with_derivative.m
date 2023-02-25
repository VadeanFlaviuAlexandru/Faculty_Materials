function retval = divided_difference_with_derivative (M)
  if (rows(M) ~= 3)
    error("Incomplete sample points");
  endif
  
  l = length(M(1,:));

  for order = 1 : l - 1
    M = [M ; zeros(1, l)];
    row_index = 2 + order;
  
    for i = 1 : l - order
      if (M(1, i + order) - M(1, i) == 0)
        M(row_index, i) = M(3, i);
        continue;
      endif
      M(row_index, i) = (M(row_index - 1, i + 1) - M(row_index - 1, i)) / (M(1, i + order) - M(1, i));
    endfor
  endfor
  M = M';
  retval = M(:, 3:end);
endfunction
