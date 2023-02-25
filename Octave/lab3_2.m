
x = [100 121 144];
f = [10 11 12];
A=[];
n = 3;
for i = 1:n
  product =1;
  for j = 1:n;
    if j~=i
      product = product .* (x([i]) - x([j]));
    endif
  end
  Ai = [1./(product)];
  A = [A,Ai];
end

y=115;
L = ((A([1]) .* f([1]))./(y - x([1])) + (A([2]) .* f([2]))./(y - x([2])) + (A([3]) .* f([3]))./(y - x([3])))    ./    (A([1])./(y - x([1])) + A([2])./(y - x([2])) + A([3])./(y - x([3])))