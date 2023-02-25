% I. Check the following operations with vectors:

% Solution:
% Line vector: 
a = [1 2 3] %alternative writing: a[1,2,3]

% Column vector: 
b = [4;5;6] % alternative writing: b=[4 5 6]'

% The product between two matrices:
% If a, b are vectors => sum of the piecewise products of the components:
% a = [a0 a1 a2 a3 ... an]
% b = [b0 b1 b2 b3 ... bn]
% c = a*b = a0*b0 + a1*b1 + a2*b2 + a3*b3 + ... + an*bn
c = a*b

% The transpose vector of b; alternative writing: d = [4 5 6]:
d = b'      

% Piecewise multiplication of 2 vectors: 
% a = [a0 a1 a2 a3 ... an]
% b = [b0 b1 b2 b3 ... bn]
% e = a.*d = [a0*b0 a1*b1 a2*b2 a3*b3 ... an*bn]
e = a.*d  

% Raising to the power 2 all the components of a matrix:
f = a.^2

% Remark: a "." before an operation will apply said operation piecewise

% Ranges:
% General formula: v = startPoint:step:endPoint
v = 1:6 % all the natural numbers from 1 to 6, with step 1
        % => 1, 2, 3, 4, 5, 6
w = 2:3:10 % => 2, 5, 8
y = 10:-1:0 % => 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0

% The exponential function applied to every component of a:
aexp = exp(a)

% The exponential function applied to a number:
a1 = exp(1) % => the number e

% Square root of the components of a:
asqrt = sqrt(a)

% The maximum and minimum value of the components of a:
M = max(a)
m = min(a)

%
[M,k]=max(a)

% The absolute value of the components of h:
h = [-2 -9 8]
k = abs(h)

% The mean value of a (media aritmetica a tuturor componentelor lui a):
% a = [a0 a1 a2 a3 ... an-1]
% mean(a) = (a0 + a1 + a2 + a3 + ... + an-1)/n
amean = mean(a)

% The geometrical mean value of a (media geometrica a tuturor componentelor lui a):
%ageo = geomean(a) % does not work apparently

% The sum of all the components of a:
asum = sum(a)

% The product of all the components of a:
aprod = prod(a)

clear() % deletes the data from the previous exercise
%                              ( 1  2  13 )         (  4  8  12 )
% II. Consider the matrices a= ( 4  5   6 ) and b = ( -1  0   5 ). 
%                              ( 7  8   9 )         (  2  3   8 )
% Check the following operations:
% a) [m,n] = size(a)
% b) t = b'
% c) c = a*b
% d) d= a.*b
% e) e = a.^2
% f) size(a)
% g) length(a)
% h) m = mean(a)
% i) m1 = mean(a,2)
% j) g = geomean(a)
% k) s = sum(a)
% l) s1 = sum(a,2)
% m) p = prod(a)
% n) p1 = prod(a,2)
% o) max(a)
% p) min(a)
% q) diag(a)
% r) m > 2
% s) a > b
% s') inv(b)
% t) det(b)
% t') f = abs(b)
% u) b = [16 15 24]'
%    x = a\b
% v) triu(a)
% w) tril(a)
% x) m = [2, 3, 5; 7, 11, 13 ; 17, 19, 23]
%    m(2,1)
% y) m(:,1) ; all rows of column 1
% z) m(2,:) ; all columns of line 2
% a1) m(2, 1 : 2) ;line 2, all but last column  
% b1) m(2, 2 :end) ; second row, all but last column
% c1) m(2:3, 2:3)  ; a submatrix

% Solution:
a = [1, 2, 13 ; 4, 5, 6 ; 7, 8, 9]
b = [4, 8, 12 ; -1, 0, 5 ; 2, 3, 8]
% a) [m,n]=size(a) => m = n = 3
[m,n] = size(a) 

% b) t = b' => t = [4, -1, 2 ; 8, 0, 3 ; 12, 5, 8]
t = b'

% c = a*b => c = [28, 47, 126 ; 23, 50, 121 ; 38, 83, 196]
c = a*b

% d) d= a.*b
d= a.*b

% e) e = a.^2
e = a.^2

% f) size(a)
asize = size(a)

% g) length(a)
alen = length(a) 

% h) m = mean(a)
m = mean(a) % the mean value of the columns of a 

% i) m1 = mean(a,2)
m1 = mean(a,2) % the mean value of the lines of a

% j) g = geomean(a)
% g = geomean(a) % does not work

% k) s = sum(a) 
s = sum(a) % the sum of the elements on each column of a

% l) s1 = sum(a,2)
s1 = sum(a,2) % the sum of the elements on each line of a

% m) p = prod(a)
p = prod(a) % the product of the elements on each column of a

% n) p1 = prod(a,2)
p1 = prod(a,2) % the product of the elements on each line of a

% o) max(a)
Ma = max(a) % a line vector with the maximum value from each column

% p) min(a)
ma = min(a) % a line vector with the minimum value from each column

% q) diag(a)
D = diag(a) % a column vector with the elements of the first diagonal of a as components

% r) m > 2
sth = m > 2 % checks if the values of m are greater than 2
            % returns a line vector with as many components as there are in m
            % the values can be either 1 (true) or 0 (false)

% s) a > b
sth2 = a > b % checks if the elements of a are greater than the elements of b
             % i.e. if a00 > b00 , a01 > b01 ... 

% s') inv(b)
Inv = inv(b) % the inverse of b

% t) det(b)
detB = det(b) % the determinant of b

% t') f = abs(b)
f = abs(b) % returns a matrix where the components are the components of b in
           % absolute value

% u) b = [16 15 24]'
b = [16 15 24]'

%    x = a\b
x = a\b % left division => inverse(a)*b

% v) triu(a)
triu_a = triu(a) % computes the triangular version of the matrix a
                 %                    ( 1  2  13 )
                 % example: triu(a) = ( 0  5   6 )
                 %                    ( 0  0   9 )
% w) tril(a)
tril_a = tril(a) % computes the triangular version of the matrix a, but
                 % the zeroes are on the upper right corner
                 %                    ( 1  0  0 )
                 % example: tril(a) = ( 4  5  0 )
                 %                    ( 7  8  9 )

% x) m = [2, 3, 5; 7, 11, 13 ; 17, 19, 23]
m = [2, 3, 5; 7, 11, 13 ; 17, 19, 23]

%    m(2,1)
x1 = m(2,1)  % the element from line 2, column 1


% y) m(:,1)
y1 = m(:,1) % all rows of column 1

% z) m(2,:) 
z1 = m(2,:) % all columns of line 2

% a1) m(2, 1 : 2)  
a11 = m(2, 1 : 2) % line 2, all but last column

% b1) m(2, 2 :end)
b11 = m(2, 2 :end) % second row, all but last column

% c1) m(2:3, 2:3)
c11 = m(2:3, 2:3)  % a submatrix

clear()

% Some particular matrices: a) eye(8); eye(5,7); zeros(5,7); ones(7,9)
% b) M = magic(4)
% sum(M); sum(M,2); sum(diag(M)); sum(diag(fliplr(M)))
% a)
eye1 = eye(8)  % 1 on the first diagonal, 0 otherwise
eye2 = eye(5,7)
zero1 = zeros(5,7) % only zeroes -> the null matrix
one1 = ones(7,9)   % only 1 in this matrix

% b)
M = magic(4)
sum_M = sum(M)
sum_M2 = sum(M,2)
sum_M3 = sum(diag(M))
sum_M4 = sum(diag(fliplr(M)))

clear()

% III. Polynomials

% 1. Evaluate the polynomial p(x) = 2*x^3 - 5*x^2 + 8 in x = 2. (Use: polyval)

% Solution:
p = [2, -5, 8]
x = 2
rez = polyval(p,x)

clear()

% 2. Find the roots of the polynomial p(x) = x^3 - 5*x^2 - 17*x +21. 
%    (Use: roots)

% Solution:
p = [1, -5, -17, 21]
roots_p = roots(p)

clear() 

% III. Graphs

% 1. Plot the functions f:[0,1]->R, f(x) = exp(10*x*(x-1))*sin(12*pi*x) and 
% f:[0,1]->R, f(x) = 3*exp(5*x^2-1)*cos(12*pi*x).

% Solution:
x = 0:0.001:1
f1 = exp(10.*x.*(x-1)).*sin(12.*pi.*x)
f2 = 3.*exp(5.*x.^2-1).*cos(12.*pi.*x)
%plot(x, f1)
%hold on 
%plot(x, f2, 'g')

clear() 

% 2. Plot the epicycloid:
%    x(t) = (a+b)*cos(t) - b*cos(((a/b)+1)*t)
%    y(t) = (a+b)*sin(t) - b*sin(((a/b)+1)*t)
%    t€[0, 10*pi], for given a, b.

% Solution:
t = 0:0.1:10*pi
a = 1
b = 1
x = (a+b).*cos(t) - b.*cos(((a/b)+1).*t)
y = (a+b).*sin(t) - b.*sin(((a/b)+1).*t)
%plot(y,x)

clear()

% 3. Plot, on a single graph, the functions: f1, f2, f3:[0,2*pi]->R,
% f1(x) = cos(x), f2(x) = sin(x), f3(x) = cos(2*x)
x = 0:0.1:2*pi 
f1 = cos(x)
f2 = sin(x)
f3 = cos(2*x)
%plot(x,f1,'r')
%hold on 
%plot(x,f2,'g')
%hold on
%plot(x,f3,'b')

clear()

% 4. Plot the graph of the function:
%           x^3 + sqrt(1-x) , -1 <= x <= 0 
% f(x) = {
%           x^3 - sqrt(1-x) , 0 < x <= 1

x1 = -1:0.001:0
x2 = 0.001:0.001:1
f1 = x1.^3 + sqrt(1.-x1)
f2 = x2.^3 - sqrt(1.-x2)
%plot(x1,f1,'g')
%hold on
%plot(x2,f2,'b')

clear()

% 5. For x in {0, 1, ... , 50}, plot the function:
%           x/2  , if x = even
% f(x) = {
%           3*x+1, if x = odd

% Solution:
x1 = 0:2:50
x2 = 1:2:49

f1 = x1./2
f2 = 3.*x2+1

%plot(x1, f1, '*')
%hold on 
%plot(x2, f2, 'o')

clear()

% 6. Compute:
% g = 1+1/(1+1/(1+1/(1+1/(1+1/(1+1)))))
% (Consider the general case, for a given number of fractions.) ?

% Solution:
g = 1+1/(1+1/(1+1/(1+1/(1+1/(1+1)))))

% 7. Plot the function g:[-2,2]X[-4, 4]->R,
% g(x,y) = exp(-((x-(1/2))^2+(y-(1/2))^2))
% (Use: meshgrid, mesh).

% Solution:
x = -2:0.1:2
y = -4:0.1:4
[X,Y] = meshgrid(x,y)
g = exp(-((X-(1/2)).^2+(Y-(1/2)).^2))
mesh(X,Y,g)

clear()












