function counts = my_cut(image, startx,starty,endx,endy)
    [height,width,channels] = size(image);
    counts = zeros(endy-starty+1, endx-startx+1, channels, 'uint8');
    for i = startx:endx
        for j =starty:endy
            counts(i-startx+1,j-starty+1,:) = image(i,j,:);
        end
    end
    if channels == 3
        counts = counts(:, :, [1, 2, 3]);
    end
    counts = uint8(counts);
end
    
