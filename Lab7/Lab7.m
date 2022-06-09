clear all;
close all;

%part a
load part2.mat; % mat-file with parameters 

fc1 = 25000;
fc2 = 40000;
fc3 = 55000;

fc = fc3;

%part b
%bandpass filter 
R = FT(r);
W = R;  
stop_index = (abs((abs(omega)-(2*pi*40000)))>(2*pi*4100));
W(stop_index) = 0;
w = IFT(W);

%part c 
%figure 10
figure;
subplot(2,1,1);
plot(t,w);
title("w(t) with fc = " + fc);
xlabel("t(s)");ylabel("w(t)");
subplot(2,1,2);
plot(omega,abs(W));
title("W(\omega) with fc = " + fc);
xlabel("\omega (rad/sec)");ylabel("W(\omega)");  
saveas(gcf, 'part3_figure10', 'png')

%part d
fc = 40000;
%ListenToMyRadio (w,fc,t,omega);

%part e
%low pass filter
W = FT(w);
Q = W;  
stop_index = (abs(omega)<(2*pi*40000));
Q(stop_index) = 0;
q = IFT(Q);

%part f
%figure 10
figure;
subplot(2,1,1);
plot(t,q);
title("q(t)");
xlabel("t(s)");ylabel("q(t)");
subplot(2,1,2);
plot(omega,abs(Q));
title("Q(\omega)");
xlabel("\omega (rad/sec)");ylabel("Q(\omega)");  
saveas(gcf, 'part3_figure11', 'png')

%part g
fc = 40000;
ListenToMyRadio (q,fc,t,omega);


