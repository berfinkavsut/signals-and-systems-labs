t = 0:1/1e3:10;
fo = 10;
f1 = 400;
y = chirp(t,fo,10,f1)
subplot(3,1,1);
plot(y);

beta = (f1-fo)/10;
fi = fo + beta*t;
subplot(3,1,2);
plot(cos(2*pi*fi.*t));

subplot(3,1,3);
plot(cos(pi*fi.*t))


