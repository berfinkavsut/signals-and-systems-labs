function [y] = DTLTI(a,b,x,Ny)
   N = length(a);
   M = length(b)-1;
   Nx = length(x);
   y = zeros(1,Ny);
   for n = 0:Ny-1                       
      for l = 1:N
          if( (n-l >= 0) && (n-l <= Ny-1) )
               % a(1) = a1, a(2) = a2, ...
               % y(1) = y0, y(2) = y1, ...
               y(n+1) = y(n+1) + a(l)*y(n-l+1); 
          end
       end
       for k = 0:M
           if( (n-k >= 0) && (n-k <= Nx-1) )
               % b(1) = b0, b(2) = b1, ...
               % x(1) = x0, x(2) = x1, ...
               % y(1) = y0, y(2) = y1, ...
               y(n+1) = y(n+1) + b(k+1)*x(n-k+1);
           end
       end          
   end 
end 