function [A] = ReadMyImage(fileName)

A=double(rgb2gray(imread(fileName)));

end