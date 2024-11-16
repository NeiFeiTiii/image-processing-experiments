function counts = k_nearest_smooth(image)
    window_size = 3;
    K = 5;
    [height,width]=size(image);
    counts = image;
    half_window = floor(window_size / 2);
    neighbor =zeros(1, window_size^2);
    for i = 1:height
        for j = 1:width
            if (i == 1) || (j == 1) || (i == height) || (j == width)
                counts(i,j) = image(i,j);
            else 
               neighbor = image(max(1, i-half_window):min(height, i+half_window), max(1, j-half_window):min(width, j+half_window));
               center_pixel = image(i, j);
               differences = abs(neighbor - center_pixel);
               [~, sorted_indices] = sort(differences);         % Return the nearest pixels` indexs.
               nearest_elements = neighbor(sorted_indices(1:K));
               counts(i,j) = sum(nearest_elements) / K;
            end
        end
    end
end