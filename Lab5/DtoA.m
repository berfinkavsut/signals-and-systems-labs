function xR = DtoA (type,Ts,dur,Xn)
 
    %generate interpolating pulse function 
    p = generateInterp(dur,Ts,type);    
    %length of Xn and p 
    N = length(Xn);
    pLength = length(p);    
    % shift of Ts in convolution 
    L = 1000; %pre-defined inside generateInterp function 
    %determine xR length and xR 
    xRLength = (N*L) + pLength - 1;
    xR = zeros(1,xRLength); 
      
    for M = 1:N
        %convolution is calculated by linear combination of 
        %multiplication of each Xn value with shifted version of p    
        %function 
        %shift operation is done by changing the interval inside xR(),
        %and the length of the each interval of xR is pLength
        xR( (((M-1)*L)+1) :(((M-1)*L)+ pLength)) = xR( (((M-1)*L)+1) : (((M-1)*L) + ... 
            pLength) ) + Xn(M)* p;
    end
    %crop the result 
    %xR=xR(1+(L*N/2): end-(L*N/2));
    xR=xR(1+(floor(pLength/2)): end-((floor(pLength/2))));
   
end 


