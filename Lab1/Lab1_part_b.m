t=[0:1/8192:1];
f0 = 440;
x1 = cos(2*pi*f0*t);
tmin = 0; 
T0 = 1/440;
tmax = T0;
plot(t,x1);
%xlim is wrote after plot 
xlim([tmin tmax]);
%sound(x1)
%soundsc(x1)


a = 3;
f0 = 440;
x2 = -1*exp((a^2 + 2).*t).*cos(2*pi*f0*t);
plot(t,x2);
%the sound is increasing its amplitude exponentially
%How does the duration of the sound that you hear change as a increases?
%sound(x2)

f0 = 510;
f1 = 40; 
%cosine inside a cosine 
%higher frequency is enveloped in the lower frequency
x3 = cos(2*pi*f1*t).*cos(2*pi*f0*t);
plot(t,x3)
%sound is waving
%pitch increases??
%sound(x3)

%sýklaþarak giden bir cosine 
x4 = cos(pi*1600*t.^2);
plot(t,x4)
%sound(x4)

x5 = cos(2*pi*(exp(t) - 100*t.^2 + 800.*t))
plot(t,x5)
%t = [0:0.1:1000];
%plot(t,exp(t) - 100*t.^2 + 800.*t)
sound(x5)


%part 3
%sound does not change with phase
t=[0:1/8192:1];
phase = 0;
x = cos(2*pi*t + phase);
%sound(x);

%part 5
