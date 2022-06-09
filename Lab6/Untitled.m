a = 0;
b = linspace(1,5,10); % length10
x = [1 2 3 4 5 4 5] %length5

Ny = 16;

y = DTLTI(a,b,x,Ny)

figure;
 t=0:0.001:1;                    % 2 secs @ 1kHz sample rate
 y=chirp(t,0,1,150);             % Start @ DC, cross 150Hz at t=1se   
 h_freq = DTLTI(aFreq,bFreq,xFreq,Nh_freq);
stem(linspace(0,pi,Nh_freq),abs(h_freq));

 plot(y);
% spectrogram(y,256,250,256,1E3); % Display the spectrogram