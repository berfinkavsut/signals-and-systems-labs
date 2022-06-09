ID = [2 1 6 0 2 4 5 9];
dur = rem(sum(ID),7);

%% PART 3
Ts = dur/4;

time = [(-dur/2):(Ts/1000):(dur/2)]; % dur = 1

pZ = generateInterp(dur,Ts,0);
pL = generateInterp(dur,Ts,1);
pI = generateInterp(dur,Ts,2);

subplot(3,1,1);
plot(time,pZ);
title('Zero Order Hold Interpolation Function');
xlabel('t');
ylabel('pZ(t)');

subplot(3,1,2);
plot(time,pL);
title('Linear Interpolation Function');
xlabel('t');
ylabel('pL(t)');

subplot(3,1,3);
plot(time,pI);
title('Ideal Bandlimited Interpolation');
xlabel('t');
ylabel('pI(t)');