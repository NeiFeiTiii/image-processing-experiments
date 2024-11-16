I = imread('bottle.png');
I_gray = im2gray(I);

% Roberts
BW_roberts_h = ~edge(I_gray, 'roberts', [], 'horizontal');
BW_roberts_v = ~edge(I_gray, 'roberts', [], 'vertical');
BW_roberts_both = ~edge(I_gray, 'roberts',0.035 , 'both');

% Prewitt
BW_prewitt_h = ~edge(I_gray, 'prewitt', [], 'horizontal');
BW_prewitt_v = ~edge(I_gray, 'prewitt', [], 'vertical');
BW_prewitt_both = ~edge(I_gray, 'prewitt', [], 'both');

% Sobel
BW_sobel_h = ~edge(I_gray, 'sobel', [], 'horizontal');
BW_sobel_v = ~edge(I_gray, 'sobel', [], 'vertical');
BW_sobel_both = ~edge(I_gray, 'sobel', [], 'both');

figure;
subplot(3, 3, 1), imshow(BW_roberts_h,[]), title('Roberts Horizontal');
subplot(3, 3, 2), imshow(BW_roberts_v,[]), title('Roberts Vertical');
subplot(3, 3, 3), imshow(BW_roberts_both,[]), title('Roberts Both');
subplot(3, 3, 4), imshow(BW_prewitt_h,[]), title('Prewitt Horizontal');
subplot(3, 3, 5), imshow(BW_prewitt_v,[]), title('Prewitt Vertical');
subplot(3, 3, 6), imshow(BW_prewitt_both,[]), title('Prewitt Both');
subplot(3, 3, 7), imshow(BW_sobel_h,[]), title('Sobel Horizontal');
subplot(3, 3, 8), imshow(BW_sobel_v,[]), title('Sobel Vertical');
subplot(3, 3, 9), imshow(BW_sobel_both,[]), title('Sobel Both');