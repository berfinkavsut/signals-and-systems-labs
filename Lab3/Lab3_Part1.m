%% Part 1

number = [9 5 4 2];
x = DTMFTRA(number);
X = FT(x);
omega = linspace(-8192*pi,8192*pi,8193);
omega = omega(1:8192);

figure;
plot(omega,abs(X));
grid on;
grid minor;
title('Fourier Transform of X for [9 5 4 2]');
xlabel('Angular Frequency');
ylabel('Amplitude of X');

%rect(t-t0/T0)
%samp_period = 1/8192;
%period = 0.25;   
%t = 0:samp_period:(period-samp_period);
%size(t);

%% X1(W, X2(W), X3(W), X4(W)
number = [9 5 4 2];
x = DTMFTRA(number);
X = FT(x);
omega = linspace(-8192*pi,8192*pi,8193);
omega = omega(1:8192);

rect = zeros(1,8192);
rect(1:2048) = 1;
x1 = x.*rect;
X1 = FT(x1); 
figure;
plot(omega,abs(X1));
grid on;
grid minor;
title('Fourier Transform of X1');
xlabel('Angular Frequency');
ylabel('Amplitude of X1');

rect = zeros(1,8192);
rect(2049:4096) = 1;
x2 = x.*rect;
X2 = FT(x2); 
figure;
plot(omega,abs(X2));
grid on;
grid minor;
title('Fourier Transform of X2');
xlabel('Angular Frequency');
ylabel('Amplitude of X2');

rect = zeros(1,8192);
rect(4097:6144) = 1;
x3 = x.*rect;
X3 = FT(x3); 
figure;
plot(omega,abs(X3));
grid on;
grid minor;
title('Fourier Transform of X3');
xlabel('Angular Frequency');
ylabel('Amplitude of X3');

rect = zeros(1,8192);
rect(6145:8192) = 1;
x4 = x.*rect;
X4 = FT(x4); 
figure;
plot(omega,abs(X4));
grid on;
grid minor;
title('Fourier Transform of X4');
xlabel('Angular Frequency');
ylabel('Amplitude of X4');

