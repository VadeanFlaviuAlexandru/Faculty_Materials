points_a = [-2, -1, 0, 1, 2];
f_a = @(x) 3 ^ x;

v_a = nevilleFormula(points_a, arrayfun(f_a, points_a), 1 / 2);
printf("Value of sqrt(3) for point a: %d \n", v_a);

points_b = [0, 1, 2, 4, 5];
f_b = @(x) sqrt(x);

v_b = nevilleFormula(points_b, arrayfun(f_b, points_b), 3);
printf("Value of sqrt(3) for point b: %d \n", v_b);