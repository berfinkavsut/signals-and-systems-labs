%% Part 5

% Figure 2
figure;
A = double(rgb2gray(imread('Part5.bmp')));
imshow(A,[]);
title('Original Image');

% Figure 3
figure;
h1 = [1 0 -1;
      2 0 -2;
      1 0 -1];
y1= DSLSI2D(h1,A);
subplot(1,2,1);
imshow(y1,[]);
title('y1');

s1 = y1.^2;
subplot(1,2,2);
imshow(s1,[]);
title('s1');

% Figure 4
figure;
h2 = [1  2  1;
      0  0  0; 
     -1 -2 -1];
y2= DSLSI2D(h2,A);
subplot(1,2,1);
imshow(y2,[]);
title('y2');

s2 = y2.^2;
subplot(1,2,2);
imshow(s2,[]);
title('s2');

% Figure 5
figure;
h3 = 0.5*h1 + 0.5*h2;
y3 = DSLSI2D(h3,A);
subplot(1,2,1);
imshow(y3,[]);
title('y3');

s3 = y3.^2;
subplot(1,2,2);
imshow(s3,[]);
title('s3');

