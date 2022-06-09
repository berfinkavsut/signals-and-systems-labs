%% Part 1
t = [0:0.002:2];
n = mod(21602459,37); % n = 9
A = 3*rand(n) + j*3*rand(n); %random A values between 0-3  
omega = pi*rand(n);

xs = SUMCS(t,A,omega);

subplot(2,2,1);
realxs = real(xs);
plot (t,realxs);
xlabel('t (s)');
ylabel('Re(xs)');
title('Real Part of xs');

subplot(2,2,2);
imagxs = imag(xs);
plot (t,imagxs);
xlabel('t (s)');
ylabel('Im(xs)');
title('Imaginary Part of xs');

subplot(2,2,3);
magnitude = abs(xs);
plot(t,magnitude);
xlabel('t (s)');
ylabel('|xs|');
title('Magnitude of xs');

subplot(2,2,4);
phase = angle(xs);
plot(t,phase);
xlabel('t (s)');
ylabel('phase (rad)');
title('Phase of xs');

%% Part 3

D17 = mod(21602459,17);
D7 = mod(21602459,7);
T = 2; W = 1; K = 23 + D17;
t = [-6:0.001:6];

xt = FSWave(t,K,T,W);

figure;

subplot(2,1,1);
realxt = real(xt);
plot (t,realxt);
title('Real Part of xt');
xlabel('t (s)');
ylabel('Re(xt)');

subplot(2,1,2);
imagxt = imag(xt);
plot (t,imagxt);
title('Imaginary Part of xt');
xlabel('t (s)');
ylabel('Im(xt)');

%min and max values detected from the graph:
%xt(min) = 
%xt(max) = 

% plot 1
K = 5 + D7;
xt = FSWave(t,K,T,W);
figure;
realxt = real(xt);
plot (t,realxt);
title('x(t) for K = 5 + D7');
xlabel('t (s)');
ylabel('x(t)');

% plot 2
K = 9 + D7; 
xt = FSWave(t,K,T,W);
figure;
realxt = real(xt);
plot (t,realxt);
title('x(t) for K = 9 + D7');
xlabel('t (s)');
ylabel('x(t)');

%plot 3
K = 16 + D7;
xt = FSWave(t,K,T,W);
figure;
realxt = real(xt);
plot (t,realxt);
title('x(t) for K = 16 + D7');
xlabel('t (s)');
ylabel('x(t)');


%plot 4
K = 60 + D7;
xt = FSWave(t,K,T,W); 
figure;
realxt = real(xt);
plot (t,realxt);
title('x(t) for K = 60 + D7');
xlabel('t (s)');
ylabel('x(t)');

%plot 5
K = 120 + D7; 
xt = FSWave(t,K,T,W);
figure;
realxt = real(xt);
plot (t,realxt);
title('x(t) for K = 120 + D7');
xlabel('t (s)');
ylabel('x(t)');


%% Part 4 

%FSWave2
K = 21+ D17; 
yt = FSWave2(t,K,T,W);
figure;
plot (t,real(yt));
title('y(t) = x(-t)');
xlabel('t (s)');
ylabel('y(t)');

%FSWave3
t0 = 0.6;
yt = FSWave3(t,K,T,W,t0);
figure;
plot (t,real(yt));
title('y(t) = x(t-t0)');
xlabel('t (s)');
ylabel('y(t)');

%FSWave4
yt = FSWave4(t,K,T,W);
figure;
plot (t,real(yt));
title('y(t) = dx(t)/dt');
xlabel('t (s)');
ylabel('y(t)');

