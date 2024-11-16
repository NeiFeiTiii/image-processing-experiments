function counts = beyond_smooth(image)
    [height,width]=size(image);
    counts = zeros(height,width);
    T = 30;
    for i = 1:height
        for j =1:width
            if (i == 1) || (j == 1) || (i == height) || (j == width)
                counts(i,j) = image(i,j);
            else
                counts(i,j) = (image(i+1,j)+image(i-1,j)+image(i,j-1)+image(i,j+1))/4;
                if abs(image(i,j) - counts(i,j)) <= T
                    counts(i,j) = image(i,j);
                end
            end
        end
    end
    counts = uint8(counts);
end