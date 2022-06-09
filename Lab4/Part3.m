x = [4 2 0; 1 7 3; 5 0 9];
h = [0 -1 0; -1 5 -1; 0 -1 0];
y = DSLSI2D(h,x);

D7 = rem(21602459,7);
B = 0.45; 

Mh = 25 + D7;
Nh = 25 + D7;
h = zeros(Mh,Nh);

for m=1:Mh
    for n=1:Nh
        h(m,n)= sinc(B*(m-((Mh-1)/2)))*sinc(B*(n-((Nh-1)/2)));
    end
end

figure;
A = double(rgb2gray(imread('Part4.bmp')));
imshow(A,[]);

figure;
denoisedImage= DSLSI2D(h,A);
imshow(denoisedImage,[]);

figure;
h1 = [1 0 -1;
      2 0 -2;
      1 0 -1];
denoisedImage2= DSLSI2D(h1,A);
imshow(denoisedImage2,[]);

figure;
h2 = [1  2  1;
      0  0  0; 
     -1 -2 -1];
denoisedImage3= DSLSI2D(h2,A);
imshow(denoisedImage3,[]);

figure;
h3 = 0.5*h1 + 0.5*h2;
y3 = DSLSI2D(h3,A);
y3 = y3.^2;
imshow(y3,[]);
