function counts = mid_number_smooth(image)      % use 3*3 square. 
    window_size = 3;
    half_window = floor(window_size / 2);
    [height,width]=size(image);
    counts = zeros(height,width);
    for i = 1:height
        for j =1:width
            if (i == 1) || (j == 1) || (i == height) || (j == width)
                counts(i,j) = image(i,j);
            else
                neighbor = image(max(1, i-half_window):min(height, i+half_window), max(1, j-half_window):min(width, j+half_window));
                sortArea = sort(neighbor);
                counts(i,j) = sortArea(ceil(window_size^2));
            end
        end
    end
    counts = uint8(counts);
end
    
    
