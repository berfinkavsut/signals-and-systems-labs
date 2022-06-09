dur = 4;
Ts = 0.005;
type=0;

figure;
t = (-dur/2) : (Ts) : (dur/2);
Xn = cos(t);
t1 = (-dur/2) : (Ts/1000) : (dur/2);
x = cos(t1);
%Xn = linspace(1,10,100);
xR = DtoA (type,Ts,dur,Xn);
%time = linspace((-dur/2),(dur/2),length(xR));
subplot(2,1,1);
plot(linspace((-dur/2),(dur/2),length(xR)),xR);
subplot(2,1,2);
plot(linspace((-dur/2),(dur/2),length(x)) , x);
