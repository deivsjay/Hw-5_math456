% Problem 6.1.10

% a.)

t(1) = 0
y(1) = 1/4;
inter(1) = 0;
inter(2) = 2;

f = @(t,y)sinh(y);

for k = 0:5
    n = (inter(2) - inter(1))/(0.1*(2^-k));
    h = (inter(2) - inter(1))/n;
    t = h;
    z = y(1) + h*sinh(y(1));
end

% b.)

t(1) = 0
y(1) = 2;
inter(1) = 0;
inter(2) = 1/4;

f = @(t,y)sinh(y);

for k = 0:5
    n = (inter(2) - inter(1))/(0.1*(2^-k));
    h = (inter(2) - inter(1))/n;
    t = h;
    z = y(1) + h*sinh(y(1));
end

t(1) = 0
y(1) = 2;
inter(1) = 0;
inter(2) = 1/4;

f = @(t,y)sinh(y);

for i = 1:6
    h(i) = 0;
    z(i) = 0;
    a(i) = 0;
    err(i) = 0;
end

for k = 0:5
    n = (inter(2) - inter(1))/(0.1*(2^-k));
    h(k+1) = h(k+1) + (inter(2) - inter(1))/n;
    t = h(k+1);
    a(k+1) = a(k+1) + 2*atan(exp(t)*tanh(1));
    z(k+1) = z(k+1) + y(1) + h(k+1)*sinh(y(1));
    err(k+1) = err(k+1) + abs(z(k+1) - a(k+1));
end

hold off
figure
loglog(h,err)

t(1) = 0;
y(1) = 2;
inter(1) = 0;
inter(2) = 1/4;

k = 0;
n = (inter(2) - inter(1))/(0.1*(2^-k));
h = [0 0.1 0.2];
t = [0 0.1 0.2];

a = 2*atan(exp(t)*tanh(1));
z = y(1) + h*sinh(y(1));
err = abs(z-a);

hold off
figure 
plot(h,z);
hold on
plot(h,a);