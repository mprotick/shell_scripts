pause -1 "first plotting the pure data set (->return)"
set logscale y
plot 'hhvt.p0-avg' u 1:2:3 w e  

pause 0 "now fitting the crrelator with A.exp[-mt] formula  :-)"
y(x) = A*exp(-m*x) 
A = 1.0
m = 1.6
show variables

pause -1 "plot with all parameters set to initial guess (->return)"
plot 'hhvt.p0-avg' u 1:2:3 w e, y(x)

FIT_LIMIT = 1e-5

pause -1 "now start fitting ... (->return)"
fit [15:28] y(x) 'hhvt.p0-avg' u 1:2:3  via A, m 

pause -1 "now look at the result (->return)"
plot 'hhvt.p0-avg' u 1:2:3 w e, y(x)

pause -1

pause 0 "That's all folks!"

