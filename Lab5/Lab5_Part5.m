a = randi([2,6]);
Ts = 1/(20*a);
%Ts = 0.001;
dur = 4*Ts;

% g(t)
t = -3 : (Ts/1000) : 3;
g = zeros(1,length(t));
g(t >= (-1) & (t < 0)) = 1;
g((t > 0) &(t <= 1)) = -1;
% Sampled g(t) = gs(t)
t1 = -3 : Ts : 3;
gs = zeros(1,length(t1));
gs(t1 >= (-1) & (t1 < 0)) = 1;
gs((t1 > 0) &(t1 <= 1)) = -1;

% Figure 2 
figure;
% g(t) plot
subplot(2,1,1);
plot(t,g);
title('Original Signal g(t)');
xlabel('t');
ylabel('g(t)');

% gs(t) plot 
subplot(2,1,2);
stem(t1,gs);
title('Sampled Signal gs(t)');
xlabel('t');
ylabel('gs(t)');

% Reconstructed gR(t) functions 
gRZ = DtoA (0,Ts,dur,gs);
gRL = DtoA (1,Ts,dur,gs);
gRI = DtoA (2,Ts,dur,gs);
timePlot = linspace(-3,3,length(gRZ));

% Figure 3
figure;
%subplot(4,1,1);
plot(t,g);
title('Original Signal g(t)');
xlabel('t');
ylabel('g(t)');

% Figure 4
figure;
%subplot(4,1,2);
plot(timePlot,gRZ);
title('Reconstruction with Zero Order Hold Interpolation');
xlabel('t');
ylabel('gRZ(t)');

% Figure 5
figure;
%subplot(4,1,3);
plot(timePlot,gRL);
title('Reconstruction with Linear Interpolation');
xlabel('t');
ylabel('gRL(t)');

% Figure 6
figure;
%subplot(4,1,4);
plot(timePlot,gRI);
title('Reconstruction with Ideal Bandlimited Interpolation');
xlabel('t');
ylabel('gRI(t)');

