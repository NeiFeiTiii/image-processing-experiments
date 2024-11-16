%{
image = [[5,5,4,4,2,0,7],
         [5,5,4,2,0,0,7],
         [4,4,4,2,0,7,7],
         [1,3,3,0,7,7,6],
         [1,0,0,0,7,7,6],
         [7,7,7,7,7,7,6],
         [7,7,7,7,7,7,6]];
%}
image = round(7*rand(7,7));
subplot(2,2,1);
imshow(image,[]);
subplot(2,2,3);
imhist(uint8(image)* 35);
[height, width] = size(image);
N = height * width;
M = 7;
k = zeros(1,M+1);
for i = 1:height
    for j = 1:width       
        k(image(i,j)+1) = k(image(i,j)+1) + 1;
    end
end
 
p = zeros(1, M+1);
for i = 1:M+1
    p(i) = k(i) / N;
end
 
s = zeros(1, M+1);
s(1) = p(1);
for i = 2:M+1
    s(i) = s(i-1) + p(i);
end
 
nk = round(s * 7);
 
newImage = zeros(height, width);
for i = 1:height
    for j = 1:width        
        newImage(i,j) = nk(image(i,j) + 1);
    end
end

subplot(2,2,2);
imshow(newImage,[]);
subplot(2,2,4);
imhist(uint8(newImage)*35);