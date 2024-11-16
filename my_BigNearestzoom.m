function counts = my_BigNearestzoom(image,height_zoom,width_zoom)
    [height, width, channels] = size(image);
    new_height = round(height * height_zoom);
    new_width = round(width * width_zoom);
    counts = zeros(new_height, new_width, channels, 'uint8');
    for c = 1:channels
        for i = 1:new_height
            for j = 1:new_width
                % Select Nearest Situation
                orig_i = round((i - 0.5) / height_zoom + 0.5);
                orig_j = round((j - 0.5) / width_zoom + 0.5);
                orig_i = min(max(orig_i, 1), height);
                orig_j = min(max(orig_j, 1), width);
                counts(i, j, c) = image(orig_i, orig_j, c);
            end
        end
    end
end