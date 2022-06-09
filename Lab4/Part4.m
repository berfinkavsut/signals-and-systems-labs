% x = [4 2 0; 1 7 3; 5 0 9];
% h = [0 -1 0; -1 5 -1; 0 -1 0];
% y = DSLSI2D(h,x);

%% Part 4

% Figure 1
figure;
subplot(2,2,1);
A = double(rgb2gray(imread('Part4.bmp')));
imshow(A,[]);
title('Original Image');

subplot(2,2,2);
B = 0.7;
h = denoise(B);
denoisedImage1 = DSLSI2D(h,A);
imshow(A,[]);
title('B = 0.7');

subplot(2,2,3);
B = 0.5;
h = denoise(B);
denoisedImage2 = DSLSI2D(h,A);
imshow(denoisedImage2,[]);
title('B = 0.5');

subplot(2,2,4);
B = 0.2;
h = denoise(B);
denoisedImage3 = DSLSI2D(h,A);
imshow(denoisedImage3,[]);
title('B = 0.2');
