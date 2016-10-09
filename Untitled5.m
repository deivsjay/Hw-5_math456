% Problem 6.1.6

% a.)

y_function = dsolve('Dy = t+y','y(0) = 0', 't');
f = @(t,y)t+y;

tknot = 0;
wknot = 0;

for i = 1:6
    a(i) = 0;
    w1(i) = 0;
    h(i) = 0;
end

for j = 0:5
    h(j+1) = h(j+1) + 0.1*2^-j;
    t = h(j+1);
    a(j+1) = a(j+1) + eval(y_function);
    w1(j+1) = w1(j+1) + wknot + h(j+1)*f(tknot,wknot);
end

loglog(h, abs(a-w1))