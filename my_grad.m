% At first, [Gx,Gy] = imgradientxy(I,method) returns the directional gradients using the specified method.
% But we dont use imgradientxy  :)

function my_grad(image, method, T)
    [height,width]=size(image);
    counts = zeros(height,width);
    binary_image = zeros(height,width);
    switch method
        case 'roberts'
            % [Gx, Gy] = imgradientxy(image, 'roberts');
            for i = 1:height
                for j =1:width
                    if (i == 1) || (j == 1) || (i == height) || (j == width)
                        counts(i,j) = image(i,j);
                    else
                       Gx = abs(image(i+1,j+1) - image(i,j));
                       Gy = abs(image(i+1,j) - image(i,j+1));
                       G = sqrt(Gx^2 + Gy^2);
                       if(G >= T)
                           counts(i,j) = G;
                           binary_image(i,j) = 1;
                       else
                           counts(i,j) = image(i,j);
                           binary_image(i,j) = 0;
                       end
                    end
                end
            end
        case 'prewitt'
            % [Gx, Gy] = imgradientxy(image, 'prewitt');
            for i = 1:height
                for j =1:width
                    if (i == 1) || (j == 1) || (i == height) || (j == width)
                        counts(i,j) = image(i,j);
                    else
                       Gx = abs(image(i+1,j+1) + image(i+1,j) + image(i+1,j-1) - image(i-1,j) - image(i-1,j-1)-image(i-1,j+1));
                       Gy = abs(image(i+1,j+1) +image(i,j+1) + image(i-1,j+1) - image(i,j-1) + image(i+1,j-1) - image(i-1,j-1));
                       G = sqrt(Gx^2 + Gy^2);
                       if(G >= T)
                           counts(i,j) = G;
                           binary_image(i,j) = 1;
                       else
                           counts(i,j) = image(i,j);
                           binary_image(i,j) = 0;
                       end
                    end
                end
            end
        case 'sobel'
            % [Gx, Gy] = imgradientxy(image, 'sobel');
            for i = 1:height
                for j =1:width
                    if (i == 1) || (j == 1) || (i == height) || (j == width)
                        counts(i,j) = image(i,j);
                    else
                       Gx = abs(image(i+1,j+1) + 2*image(i+1,j) + image(i+1,j-1) - 2*image(i-1,j) - image(i-1,j-1)-image(i-1,j+1));
                       Gy = abs(image(i+1,j+1) + 2*image(i,j+1) + image(i-1,j+1) - 2*image(i,j-1) + image(i+1,j-1) - image(i-1,j-1));
                       G = sqrt(Gx^2 + Gy^2);
                       if(G >= T)
                           counts(i,j) = G;
                           binary_image(i,j) = 1;
                       else
                           counts(i,j) = image(i,j);
                           binary_image(i,j) = 0;
                       end
                    end
                end
            end
        case 'grad'
            for i = 1:height
                for j =1:width
                    if (i == 1) || (j == 1) || (i == height) || (j == width)
                        counts(i,j) = image(i,j);
                    else
                       Gx = abs(image(i,j+1)-image(i,j));
                       Gy = abs(image(i+1,j)-image(i,j));
                       G = sqrt(Gx^2 + Gy^2);
                       if(G >= T)
                           counts(i,j) = G;
                           binary_image(i,j) = 1;
                       else
                           counts(i,j) = image(i,j);
                           binary_image(i,j) = 0;
                       end
                    end
                end
            end
        otherwise
            error('Unsupported method. Choose from ''roberts'', ''prewitt'', or ''sobel''.');
    end

    figure;
    subplot(1, 3, 1);
    imshow(image,[]);
    title('Origional');
    subplot(1,3,2);
    imshow(counts,[]);
    title('Improved');
    subplot(1,3,3);
    imshow(binary_image);
    title('Binary',[]);
end