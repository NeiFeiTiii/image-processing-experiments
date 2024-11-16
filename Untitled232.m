close all;

image = imread('cell.png');
gray_image = im2gray(image);
% imshow(image,[]);

threshold_value = 100; 
binary_image = gray_image > threshold_value;

BW_roberts_both = ~edge(~binary_image, 'roberts',0.05 , 'both');


figure;

subplot(1, 3, 1);
imshow(gray_image,[]);
title('Original Image');

subplot(1, 3, 2);
imshow(binary_image,[]);
title('Threshold Segmentation');

subplot(1,3,3)
imshow(BW_roberts_both,[]);
title('Roberts');
