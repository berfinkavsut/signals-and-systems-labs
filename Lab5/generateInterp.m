function p = generateInterp(dur,Ts,type)
 
    time = (-dur/2):(Ts/1000):(dur/2);       
    if (type == 0 )
        p = ones(1,length(time)); 
        % for the time indices more than Ts/2 and less than -Ts/2 
        % the function is zero 
        p(time >= (Ts/2) | time <= (-Ts/2))= 0;  
        
    elseif (type == 1)
        p = zeros(1,length(time));
        p = 1 - (abs(time/(2*Ts))/0.5);
        % for the time indices more than Ts and less than -Ts
        % the function is zero 
        p(time > Ts | time < (-Ts)) = 0;    
        
    elseif (type == 2)        
        % sinc(t) is defined separetely for t < 0, t = 0 and t > 0
        % because sinc(t) = sin(pi*t)/(pi*t) is not defined for t = 0   
        % (denominator = 0)
        % therefore, the vector did not generate any value for t = 0
        % in this way, the problem is solved and t = 0 is defined          
        timeZero = find(time == 0); % find the index of t = 0
        p = zeros(1,length(time));
        p(1:(timeZero -1)) = sin(pi*time(1:(timeZero -1))/Ts)./(pi*time(1:(timeZero -1))/Ts);
        p(timeZero) = 1;
        p((timeZero + 1):length(time)) = sin(pi*time((timeZero+1):length(time))/Ts)./(pi*time((timeZero+1):length(time))/Ts); 
    end 
end 

