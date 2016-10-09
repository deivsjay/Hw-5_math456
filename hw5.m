clear
clc

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

% b.)

y_function = dsolve('Dy = t-y','y(0) = 0', 't');
f = @(t,y)t-y;

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

hold off 
figure
loglog(h, abs(a-w1))

% c.)

y_function = dsolve('Dy = 4*t-2*y','y(0) = 0', 't');
f = @(t,y)t-y;

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

hold off 
figure
loglog(h, abs(a-w1))

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

% Problem 6.2.6

% a.)

yfun = dsolve('Dy = 1 - y^2', 'y(0) = 0', 't');

for i = 1:11
    a(i) = 0;
    w1(i) = 0;
    h(i) = 0;
end

for k = 0:10
    h(k+1) = h(k+1) + k/10;
    t = h(k+1);
    a(k+1) = a(k+1) + eval(yfun);
    f = @(t,y)1-y^2;
    
    t0 = 0;
    w0 = 0;
    
    w1(k+1) = w1(k+1) + w0 + (h(k+1)/2)*(f(t0,w0) + f(t0 + h(k+1),w0 + h(k+1)*f(t0,w0)));
end

hold off
figure 
plot(h,a);
hold on
plot(h,w1);

% b.)

yfun = dsolve('Dy = 1 - y^2', 'y(0) = -0.5', 't');

for i = 1:11
    a(i) = 0;
    w1(i) = 0;
    h(i) = 0;
end

for k = 0:10
    h(k+1) = h(k+1) + k/10;
    t = h(k+1);
    a(k+1) = a(k+1) + eval(yfun);
    
    f = @(t,y)1-y^2;
    
    t0 = 0;
    w0 = 0;
    w1(k+1) = w1(k+1) + w0 + (h(k+1)/2)*(f(t0,w0) + f(t0 + h(k+1),w0 + h(k+1)*f(t0,w0)));
end

hold off
figure 
plot(h,a);
hold on
plot(h,w1);

% Problem 6.2.8

% a.)

t(1)=0; 
y(1)=0; 
inter(1)=0;
inter(2)=2;
f=@(t,y)sinh(y);

for k=0:5
    n=(inter(2)-inter(1))/(0.1*(2^-k));
    h=(inter(2)-inter(1))/n;
    
    f=@(t,y)sinh(y);
    
    t0=0;
    w0=1/4;
    w1=w0+(h/2).*(f(t0,w0)+f(t0+h,w0+h*f(t0,w0)));
end

t(1)=0; 
y(1)=2; 
inter(1)=0;
inter(2)=1/4;

f=@(t,y)sinh(y);

for i=1:6
    h(i)=0; 
    w1(i)=0; 
    a(i)=0; 
    err(i)=0;
end

w0=2; 
t0=0;

for k=0:5
    n=(inter(2)-inter(1))/(0.1*(2^-k));
    h(k+1)=h(k+1)+(inter(2)-inter(1))/n;
    t=h(k+1);
    a(k+1)=a(k+1)+2*atanh(exp(t)*tanh(1));
    w1(k+1)=w1(k+1)+w0+(h(k+1)/2)*(f(t0,w0)+f(t0+h(k+1),w0+h(k+1)*f(t0,w0)));
    disp([k h(k+1) a(k+1)]) 
end

loglog(h,err)

% b.) 

t(1)=0; 
y(1)=2; 
inter(1)=0;
inter(2)=1/4;
f=@(t,y)sinh(y);

for k=0:5
    n=(inter(2)-inter(1))/(0.1*(2^-k));
    h=(inter(2)-inter(1))/n;
    f=@(t,y)sinh(y);
    t0=0;
    w0=2;
    w1=w0+(h/2).*(f(t0,w0)+f(t0+h,w0+h*f(t0,w0)));
    disp([h w1])
end

t(1)=0; 
y(1)=2; 
inter(1)=0;
inter(2)=1/4;
f=@(t,y)sinh(y);

for i=1:6
    h(i)=0; w1(i)=0; a(i)=0; err(i)=0;
end

w0=2;
t0=0;

for k=0:5    
    h(k+1)=h(k+1)+(inter(2)-inter(1))/n;
    t=h(k+1);
    a(k+1)=a(k+1)+2*atanh(exp(t)*tanh(1));
    w1(k+1)=w1(k+1)+w0+(h(k+1)/2)*(f(t0,w0)+f(t0+h(k+1),w0+h(k+1)*f(t0,w0)));  
    disp([k h(k+1) a(k+1)]) 
end

for k=1:6
   m(k)=h(k); 
   b(k)=a(k); 
   z(k)=w1(k);
end

plot(m,b); 
hold on
plot(m,z);