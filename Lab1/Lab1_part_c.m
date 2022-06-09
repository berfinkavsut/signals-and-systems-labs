%Part 1
%part c
% 
% tic; 
% a = [1 2 3 4]
% toc
% 
% %consumes less time
% tic;
% a = [1 2 3 4];
% toc;

%when we do not need to display the result, we can use ";"
%Elapsed time is 0.000287 seconds.
disp('a = [0:0.1:10]; result of a')
tic;
a = [0:0.1:10];
toc

%when we do not need to display the result, we can use ";"
%Elapsed time is 0.000287 seconds.
disp('a = [0:0.1:10] result of a')
tic;
a = [0:0.1:10]
toc

disp('for loop result of a')
i = (10-0)/0.1
a = [];

%Elapsed time is 0.006175 seconds.
tic; 
for j = 0:i
    a(j+1) = 0.1*j;
end
toc
a
%Answer: for loop takes more time than a = [0:0.1:10];


%now, allocate memort to a first
%Elapsed time is 0.000748 seconds.
disp('after memory allocation')
a = zeros(1,(10-0)/0.1 + 1);
i = (10-0)/0.1
tic; 
for j = 0:i
    a(j+1) = 0.1*j;
end
toc
%with memory allocation, it takes more time 

%Answer: using [0:0.1:10] is the method for consuming the least time 

%part l 
%m,n
t=[0:0.01:3];
x=2*cos(2*pi*t);

%figure
%plot(x);

%figure
%plot(t,x);

%dots are connected with line 
%figure
%plot(t,x,'-*');

%dots are seperate
%figure
%plot(t,x,'*');


%xlim = [xmin xmax]
%ylim = [ymin ymax]
%grid ????

%[tmin:interval:tmax]
t = [0:0.1:10]
%linspace(tmin,tmax,number of terms including tmin and tmax)
t = linspace(0,10,101)

%part r-s
t=[0:0.01:1];
x=cos(2*pi*t+pi/4);
figure;
plot(t,x,'-b');
hold on
t=[0:0.05:1];
x=cos(2*pi*t+pi/4);
plot(t,x,'-r');

t=[0:0.1:1];
x=cos(2*pi*t+pi/4);
plot(t,x,'-y');

t=[0:0.2:1];
x=cos(2*pi*t+pi/4);
plot(t,x,'-m');

%t=[0:0.01:1]; is the best choice

%x part
t=[1 2 3 4];
x = [-2 pi 6 2*pi];
figure;
plot(t,x);

figure;
t=[0:0.01:1];
x=cos(2*pi*t+pi/4);
%for discrete-time functions, stem is better
stem(t,x);