%% Part 2

info = audioinfo('furelise.wav');
x = audioread('furelise.wav');
x = x'; % row vector, now
T = info.Duration; % or T = info.TotalSamples / info.SampleRate;
totalSamples = info.TotalSamples; % or totalSamples = length(x)
Fs = info.SampleRate;
t=0:(1/Fs):(T-1/Fs);

A1 = 0.8; A2 = 0.4; A3 = 0.2; A4 = 0.1;
t1 = 0.8; t2 = 1.6; t3 = 2.4; t4 = 3.2;
shift1 = t1 * Fs; shift2 = t2 * Fs;
shift3 = t3 * Fs; shift4 = t4 * Fs;

x1 = [zeros(1,shift1) A1*x(1,1:(totalSamples-shift1)) ];
x2 = [zeros(1,shift2) A2*x(1,1:(totalSamples-shift2)) ];
x3 = [zeros(1,shift3) A3*x(1,1:(totalSamples-shift3)) ];
x4 = [zeros(1,shift4) A4*x(1,1:(totalSamples-shift4)) ];
y = x + x1 + x2 + x3 + x4; 

figure;
plot(t,x);
grid on;
grid minor;
title('x(t)');
xlabel('Time (s)');
ylabel('Amplitude of x(t)');

figure;
plot(t,y);
grid on;
grid minor;
title('y(t)');
xlabel('Time (s)');
ylabel('Amplitude of y(t)');

%soundsc(y,8192);

omega=linspace((-Fs*pi),(Fs*pi),(T*Fs+1));
omega=omega(1:(T*Fs));
H = 1 + A1*exp(-j.*omega.*t1) + A2*exp(-j.*omega.*t2) + A3*exp(-j.*omega.*t3) + A4*exp(-j.*omega.*t4); 
h = IFT(H);

figure;
subplot(2,1,1);
plot(t,h);
grid on;
grid minor;
title('h(t)');
xlabel('Time (s)');
ylabel('Amplitude of h(t)');

subplot(2,1,2);
plot(omega,abs(H));
grid on;
grid minor;
title('|H|');
xlabel('angular frequency (rad)');
ylabel('Magnitude of H');

Y = FT(y);
Xe = Y ./H;
xe = IFT(Xe);
soundsc(xe,8192);
figure;
plot(t,xe);
grid on;
grid minor;
title('Estimated x(t)');
xlabel('Time (s)');
ylabel('Amplitude of Estimated x(t)');
