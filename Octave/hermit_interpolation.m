function retval = hermit_interpolation (sample)
%   if rows(sample) ~= 3
%     error('Invalid sample input');
%   end
  m = columns(sample) - 1;
  
  divided_diffs = divided_difference_with_derivative(sample);
  
  retval = @(x) sample(2, 1);
  for i = 1 : m
    curr = @(x) 1;
    
    for j = 0 : i - 1
      curr = @(x) curr(x) * (x - sample(1, j + 1));
    end
    retval = @(x) retval(x) + curr(x) * divided_diffs(1, i);
    
  end
 
endfunction
