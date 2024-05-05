syms t s X

% Define the Laplace transform of the given function
Xs = solve(5*s^2*X + (1/9)*s*X + 2*X == 8/s + 1/(s^2 + 1), X);

% Inverse Laplace transform to find x(t)
xt = ilaplace(Xs);

% Display the result
disp('The solution for x(t) is:')
disp(xt)
