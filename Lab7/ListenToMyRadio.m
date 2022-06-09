function [] = ListenToMyRadio (r,fc,t,omega)
   % close all;
    R = FT(r);
    %figure 1 
    figure;
    subplot(2,1,1);
    plot(t,r);
    title("r(t) with fc = " + fc);
    xlabel("t(s)");ylabel("r(t)");
    subplot(2,1,2);
    plot(omega,abs(R));
    title("R(\omega) with fc = " + fc);
    xlabel("\omega (rad/sec)");ylabel("R(\omega)");
   % saveas(gcf, 'figure7', 'png')
    
    d = r.*cos(2*pi*fc*t);
    D = FT(d);
    %figure 2 
    figure;
    subplot(2,1,1);
    plot(t,d);
    title("d(t) with fc = " + fc);
    xlabel("t(s)");ylabel("d(t)");
    subplot(2,1,2);
    plot(omega,abs(D));
    title("D(\omega)with fc = " + fc);
    xlabel("\omega (rad/sec)");ylabel("D(\omega)");
   % saveas(gcf, 'figure8', 'png')
    
    %low pass filter
    M = D;
    pass_index = (abs(omega)>(2*pi*4000));
    M(pass_index) = 0;
    m = IFT(M);
    %figure 3 
    figure;
    subplot(2,1,1);
    plot(t,m);
    title("m(t) with fc = " + fc);
    xlabel("t(s)");ylabel("m(t)");
    subplot(2,1,2);
    plot(omega,abs(M));
    title("M(\omega) with fc = " + fc);
    xlabel("\omega (rad/sec)");ylabel("M(\omega)");  
  %  saveas(gcf, 'figure9', 'png')
    
    %listen the message 
    sampled = m(ceil(linspace(1,length(m),ceil(length(m)/2))));
    sound(sampled,160000)
    
end 
