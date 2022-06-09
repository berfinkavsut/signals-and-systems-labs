%% Part 1

A = double(rgb2gray(imread('Part1.bmp')));
%imagesc(A);
imshow(A);

%why map is [] matrix??
%[X,map] = imread('Part1.bmp');
%imshow(A,map);


%[A,map] = imread(___) reads the indexed image in filename into A and reads 
%its associated colormap into map. Colormap values in the image file are automatically 
%rescaled into the range [0,1].

MAX = max(max(A));
MIN = min(min(A));

figure;
A1 = A-MIN;
imshow(A1,[]);
% %savefig('A-MIN.fig')

% red = linspace(0,1,512);
% green = linspace(0,1,512);
% blue = linspace(0,1,512);
% imshow(A1,[red',green',blue']);

figure;
A2 = A/MAX; 
imshow(A2,[]);
%savefig('A/MAX.fig')

figure;
A3 = A-0.5;
imshow(A3,[]);
%savefig('A-0,5.fig')
