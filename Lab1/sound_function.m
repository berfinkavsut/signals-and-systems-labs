amp=10 
fs=20000  % sampling frequency
duration=10
freq=1000
values=0:1/fs:duration;
a=amp*sin(2*pi* freq*values)
%sound(a)
t =[0:1/8192:1];
x = cos(2*pi*440*t).*cos(2*pi*5*t);
%sound(x)
x = exp(-5*t).*cos(2*pi*2200*t);
sound(x)

