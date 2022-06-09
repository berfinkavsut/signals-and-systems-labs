%% Part 4

function [h] = denoise(B)

    D7 = rem(21602459,7); % D7 = 4

    % define length of h[m,n]
    Mh = 25 + D7;
    Nh = 25 + D7;
    h = zeros(Mh,Nh);

    %construct transfer function h[m,n] 
    for m = 1:Mh
        for n = 1:Nh
            h(m,n)= sinc(B*(m-((Mh-1)/2)))*sinc(B*(n-((Nh-1)/2)));
        end
    end
end