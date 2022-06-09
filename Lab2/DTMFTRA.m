function [x] = DTMFTRA (Number)
   % 0,1,...,9
   col = [1336 1209 1336 1477 1209 1336 1477 1209 1336 1477];
   row = [941 697 697 697 770 770 770 852 852 852 ]
   
   N = length(number);
   
   samp_period = 1/8192;
   period = 0.25;   
   
   t = 0:samp_period:(period-samp_period)
   xt = [];
   x = [];
   
   for i= 1:N
          fr = row( Number(i) + 1);
          fc = col( Number(i) + 1);
          t = t + (0.25*(N-1));
          xt = cos(2*pi*fr*t) + cos(2*pi*fc*t);
          x = [x xt];
   end
end 