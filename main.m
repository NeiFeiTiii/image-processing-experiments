image = imread('iris.tif');
myhist = my_imhist(image);
subplot(2,1,1);
my_imhist(image);
bar(0:255, myhist);
title('Myimhist`s picture');
xlabel('Grayscale');
ylabel('Number of pixels');
matlab_hist = imhist(image);

subplot(2, 1, 2);
imhist(image);
title('MATLAB_imhist`s picture');
xlabel('Grayscale');
ylabel('Number of pixels');

% Black pixels is in 0~50.
sumBlack = 0;
for i = 1:50
    sumBlack = sumBlack + myhist(i);
end
sumBlack;




