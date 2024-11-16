%org = imread('sunset.jpg');     % Change to gray picture.
%image = rgb2gray(org);
 
image = imread('pout.jpg');   % Or input a gray picture.
M = 255;                    % Mf == Mg, MAX GRAY RATE
a = 255 * 0.3;              % a,Customize
b = 255 * 0.6;              % b,Customize
c = a + 50;                 % c, the offset is 50
d = b - 50;                 % d, with offset = 50
[height,width]=size(image); % Get the range
newImage = zeros(height, width);        % Init
for i = 1:height                        % Recycling to deal this mission !!!
    for j = 1:width
        if(image(i,j) >= 0 && image(i,j)<a)
            newImage(i,j) = (c/a) * image(i,j);
        elseif(image(i,j) >=a && image(i,j) <b)
            newImage(i,j) = ((d-c)/(b-a))*(image(i,j) - a) + c;
        else
            newImage(i,j) = ((M-d)/(M-b))*(image(i,j)-b)+d;
        end
    end
end
figure(1);                  % Show
subplot(2,2,1);
imshow(image);
title("Origional");
subplot(2,2,2);
imshow(uint8(newImage));
title("New");
subplot(2,2,3);
imhist(image);
subplot(2,2,4);
imhist(uint8(newImage));