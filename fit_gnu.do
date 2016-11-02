set logscale y

y(x) = A*exp(-m*x)
A = 0.4
m = 0.06
show variables

FIT_LIMIT = 1e-5

fit [8:27] y(x) 'jk-cor' u 1:2:3  via A, m
