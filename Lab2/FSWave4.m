function [xt] = FSWave4(t,K,T,W)

    % coefficients from integration for 
    % each harmanic component of the signal 
    Xk = zeros(1,2*K + 1); 
    
    %omegas for each harmonic signal 
    omega = zeros(1,2*K + 1); 

    
    for k = -K:K
        omega(k+K+1) = (2*pi*k)/T;
        if (k~=0)
            Xk(k+K+1) = sin((W*k*pi)/T)*( (W^2)/(4*pi*k) - (T^2)/(2*pi^3*k^3) - 1/(pi*k)) ...
            +cos (W*k*pi/T)*(W*T/(2*(pi^2)*k^2));           
        else
            Xk(k+K+1) = (W^3)/(12*T) - (W/T);            
        end            
    end
   
    xt = SUMCS(t,Xk,omega);
    h=t(2)-t(1);
    der = diff(xt)/h;
    der(length(xt)) = der(length(xt)-1);
    xt = der;
           
end
