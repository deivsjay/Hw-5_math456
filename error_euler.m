function error_euler
yfun = dsolve('Dy = t+y','y(0) = 0', 't');
f = @(t,y)t+y;
t0 = 0;
w0 = 0;

for i = 1:6
    a(i) = 0;
    w1(i) = 0;
    h(i) = 0;
end

for k = 0:5
    h(k+1) = h(k+1) + 0.1*2^-k;
    t = h(k+1);
    a(k+1) = a(k+1) + eval(yfun);
    w1(k+1) = w1(k+1) + w0 + h(k+1)*f(t0,w0);
end

loglog(h, abs(a-w1))
end