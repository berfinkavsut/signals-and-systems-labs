D = rem(21602459,9); % D = 2
%Ts = 0.005*(D+1); % Ts = 0.0150
%Ts = 0.5+ 0.01*D;
%Ts = 0.18 + 0.0005*(D+1);
%Ts = 0.0999;
Ts = 1; % best result, lowest sampling period
            % highest sampling frequency 
dur = 4;
t = -2 : (Ts/10000) : 2;
t1 = -2 : Ts : 2;

%Original x(t)
x = 0.25*cos(2*pi*3*t + (pi/4))+ 0.4*cos(2*pi*5*t ... 
    - (pi/3)) + 0.9*cos(2*pi*t + pi/4);
%Sampled xs(t)

xs = 0.25*cos(2*pi*3*t1 + (pi/4))+ 0.4*cos(2*pi*5*t1 ... 
    - (pi/3)) + 0.9*cos(2*pi*t1 + pi/4);

% Figure 7
figure;
subplot(2,1,1);
plot(t,x);
title('Original Signal x(t)');
xlabel('t');
ylabel('x(t)');

subplot(2,1,2);
stem(t1,xs);
title('Sampled Signal xs(t) (Ts = 0.01)');
xlabel('t');
ylabel('xs(t)');

%Reconstructed xR(t)
xRZ = DtoA (0,Ts,dur,xs);
xRL = DtoA (1,Ts,dur,xs);
xRI = DtoA (2,Ts,dur,xs);

timePlotZ = linspace(-2,2,length(xRZ));
timePlotL = linspace(-2,2,length(xRL));
timePlotI = linspace(-2,2,length(xRI));

% % Figure 8
% %figure;
% 
% plot(t,x);
% title('Original Signal x(t)');
% xlabel('t');
% ylabel('x(t)');

% % Figure 9
 figure;
subplot(3,1,1);
plot(timePlotZ,xRZ);
title('Reconstruction with Zero Order Hold Interpolation');
xlabel('t');
ylabel('xRZ(t)');

% Figure 10
%figure;
subplot(3,1,2);
plot(timePlotL,xRL);
title('Reconstruction with Linear Interpolation');
xlabel('t');
ylabel('xRL(t)');
% 
% Figure 11
%figure;
subplot(3,1,3);
plot(timePlotI,xRI);
title('Reconstruction with Ideal Bandlimited Interpolation');
xlabel('t');
ylabel('xRI(t)');



