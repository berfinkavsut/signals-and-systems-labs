%% Part 3 

function [y]=DSLSI2D(h,x)

    sizeH = size(h);
    sizeX = size(x);

    Mh = sizeH(1);
    Nh = sizeH(2);
    Mx = sizeX(1);
    Nx = sizeX(2);
    
    % The size of y matrix depends on the length of x,
    % and length of h, there is -1 for the intersection 
    % for h leaving x when convolution is operated 
    % the intersection is both in row and column operations 
    y = zeros(Mx+Mh-1,Nx+Nh-1);

    for k=0:Mh-1
        for l=0:Nh-1
           % this is for LC of the outputs of each input inside x
           % the operation is in opposite way,i.e. x is viewed as   
           % the impulse response and h is the input to the syste
           % for each element of h, we have the weighted and shifted      
           % version of x in y, these outputs are accumulated in y            
           y(k+1:k+Mx,l+1:l+Nx)=y(k+1:k+Mx,l+1:l+Nx)+h(k+1,l+1)*x;
        end
    end
end 
