close all; 

% Test Code
a = [1 3];
b = [2 4];
x = [1 3];
Ny = 6;
y = DTLTI(a,b,x,Ny);

%% Part 2
ID = 21602459;
D6 = rem(ID,6);
M = 4 + D6;
m = M-1;
k = [0:M-1];
b = exp(-k);
a = 0;
Nh = 15;

% Unit Impulse Function
x = zeros(1,11);
x(1) = 1;

% Impulse Response
% Figure 1
h = DTLTI(a,b,x,Nh);
n = [0:Nh-1];
stem(n,h);
title("Impulse Response");
xlabel("n"); ylabel("h[n]");

%part e
% Figure 2
omega = linspace(-pi,pi,1000);
h = (1-exp((-m*j*omega)-m))./(1-exp((-1*j*omega)-1));
magH = abs(h);
plot(omega,magH);
title("Frequency Response of the System");
xlabel("omega (rad)");ylabel("|h(e^j^\Omega)|");

%3dB bandwidth
maxH = max(magH)
ind = find(magH >= (maxH/sqrt(2)));
cut_off_value = magH(ind(1));
cut_off_freq1 = omega(ind(1));
cut_off_freq2 = -cut_off_freq1; %symmetric
bandwidth = cut_off_freq2*2;

% part f

%sweep function 
fs = 1000;
Ts = 1/fs;
tfinal=1;
t = 0:Ts:tfinal;
f0 = 0;
k = 500/tfinal;
fins = f0 + k*t;
xFreq = cos(pi*fins.*t);

%a and b discrete functions 
ID = 21602459;
D6 = rem(ID,6);
M = 4 + D6;
kFreq = 0:(M-1);
bFreq = exp(-kFreq);
aFreq = 0;

%frequency response function 
Nh_freq = length(bFreq) + length(xFreq) - 1;
h_freq = DTLTI(aFreq,bFreq,xFreq,Nh_freq);

% Figure 3
subplot(2,1,1);
% from 0 to 500 Hz with sampling frequency fs = 1000
stem(linspace(0,500,length(xFreq)),xFreq);
title("Sampled Chirp Signal with Ts = 0.001");
xlabel("t (s)");ylabel("x_s(t)");

subplot(2,1,2);
%plot h_freq from 0 to 2*pi
stem(linspace(0,2*pi,Nh_freq),abs(h_freq)); 
%crop the frequency response function from 0 to pi 
xlim([0 pi]);
title("Frequency Response of the System with fs = 1000");
xlabel("\Omega (rad)");ylabel("H_s(\Omega)");

% Figure 4
figure;
subplot(3,1,1);
%plot h_freq from 0 to 2*pi
plot(linspace(0,2*pi,Nh_freq),abs(h_freq)); 
%crop the frequency response function from 0 to pi 
xlim([0 pi]);
title("Frequency Response of the System (0<=t<=1)");
xlabel("\Omega (rad)");ylabel("H_s(\Omega)");

%sweep function (0<=t<=10)
tfinal=10;
t = 0:Ts:tfinal;
f0 = 0;
k = 500/tfinal;
fins = f0 + k*t;
xFreq2 = cos(2*pi*fins.*t);

%frequency response function 
Nh_freq2 = length(bFreq) + length(xFreq2) - 1;
h_freq2 = DTLTI(aFreq,bFreq,xFreq2,Nh_freq2);

%plot (0<=t<=10)
subplot(3,1,2);
%plot h_freq from 0 to 2*pi
plot(linspace(0,2*pi,Nh_freq2),abs(h_freq2)); 
%crop the frequency response function from 0 to pi 
xlim([0 pi]);
title("Frequency Response of the System (0<=t<=10)");
xlabel("\Omega (rad)");ylabel("H_s(\Omega)");

%sweep function (0<=t<=10)
tfinal=100;
t = 0:Ts:tfinal;
f0 = 0;
k = 500/tfinal;
fins = f0 + k*t;
xFreq3 = cos(2*pi*fins.*t);

%frequency response function 
Nh_freq3 = length(bFreq) + length(xFreq3) - 1;
h_freq3 = DTLTI(aFreq,bFreq,xFreq3,Nh_freq3);

%plot (0<=t<=100)
subplot(3,1,3);
%plot h_freq from 0 to 2*pi
plot(linspace(0,2*pi,Nh_freq3),abs(h_freq3)); 
%crop the frequency response function from 0 to pi 
xlim([0 pi]);
title("Frequency Response of the System (0<=t<=100)");
xlabel("\Omega (rad)");ylabel("H_s(\Omega)");

%% Part 4

%part g
%close all;
clear all;
omega = linspace(-pi,pi,1000);
ID = [2 1 6 0 2 4 5 9];
n = zeros(1,8);
for k = 1:8 
    n(k) = 3 + ID(k);
end

%display n
n
%display z1, p1 and p2
z1 = (n(1) + 1i*n(8))/(sqrt(n(1)^2 + n(8)^2))
p1 = (n(3) + 1i*n(6))/(sqrt(1 + n(3)^2 + n(6)^2))
p2 = (n(4) + 1i*n(5))/(sqrt(1 + n(4)^2 + n(5)^2))
H = (exp(j*omega)-z1)./((exp(j*omega)-p1).*(exp(j*omega)-p1));

%Figure 5
figure;
plot(omega,abs(H));
%xlim ([0 pi]);
title("DTFT");
xlabel("\Omega"); ylabel("H(e^j^\Omega)");

%% 
%Filter Coefficients

a = [ p1+p2  -p1*p2 ];
b = [ 0 1 -z1 ]; 

fs = 1000;
Ts = 1/fs;
tfinal=1;
t = 0:Ts:tfinal;
f0 = -500;
k = 500/tfinal;
phi = f0*t + k*t.^2;
chirp = exp(1i*pi*phi);


%frequency response
h = DTLTI(a,b,chirp,length(t)*10);

% Figure 5
figure;
subplot(3,2,1);
plot(linspace(-pi,pi,length(h)),abs(h)); 
%crop the frequency response function from 0 to pi 
%xlim([0 pi]);
title("Frequency Response of the System (0<=t<=1)");
xlabel("\Omega (rad)");ylabel("Magnitude");

subplot(3,2,2);
plot(linspace(-pi,pi,length(h)),angle(h)); 
title("Phase for (0<=t<=100)");
xlabel("\Omega (rad)");ylabel("phase angle");

%0-10
fs = 1000;
Ts = 1/fs;
tfinal=10;
t = 0:Ts:tfinal;
k = 1000/tfinal;
phi = f0*t + k*t.^2;
chirp = exp(1i*pi*phi);

%frequency response
h = DTLTI(a,b,chirp,length(t)*10);

%plot 
subplot(3,2,3);
plot(linspace(-pi,pi,length(h)),abs(h)); 
%xlim([0 pi]);
title("Frequency Response of the System (0<=t<=10)");
xlabel("\Omega (rad)");ylabel("Magnitude");

subplot(3,2,4);
plot(linspace(-pi,pi,length(h)),angle(h)); 
title("Phase for (0<=t<=10)");
xlabel("\Omega (rad)");ylabel("phase angle");

%0-10
fs = 1000;
Ts = 1/fs;
tfinal=100;
t = 0:Ts:tfinal;
k = 1000/tfinal;
phi = f0*t + k*t.^2;
chirp = exp(1i*pi*phi);

%frequency response
h = DTLTI(a,b,chirp,length(t)*10);
%plot 
subplot(3,2,5);
plot(linspace(-pi,pi,length(h)),abs(h)); 
%xlim([0 pi]);
title("Frequency Response of the System (0<=t<=100)");
xlabel("\Omega (rad)");ylabel("Magnitude");

subplot(3,2,6);
plot(linspace(-pi,pi,length(h)),angle(h)); 
title("Phase for (0<=t<=100)");
xlabel("\Omega (rad)");ylabel("phase angle");









