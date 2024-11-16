function counts = local_smooth(image)   %four_area
    [height,width]=size(image);
    counts = zeros(height,width);
    for i = 1:height
        for j =1:width
            if (i == 1) || (j == 1) || (i == height) || (j == width)
                counts(i,j) = image(i,j);
            else
                counts(i,j) = (image(i+1,j)+image(i-1,j)+image(i,j-1)+image(i,j+1))/4;
            end
        end
    end
    counts = uint8(counts);
end
                
    
