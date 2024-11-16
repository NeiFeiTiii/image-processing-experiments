function counts = my_BigBInsertzoom(image, height_zoom, weight_zoom)
    [height, width, channels] = size(image);
    new_height = round(height * height_zoom);
    new_width = round(width * weight_zoom);
    counts = zeros(new_height, new_width, channels, 'uint8');

    for c = 1:channels
        for i = 1:new_height
            for j = 1:new_width
                orig_i = (i - 0.5) / height_zoom + 0.5;
                orig_j = (j - 0.5) / weight_zoom + 0.5;
                
                i1 = max(floor(orig_i),1);
                i2 = min(i1 + 1, height);
                j1 = max(floor(orig_j),1);
                j2 = min(j1 + 1, width);
                
                di = orig_i - i1;       % u
                dj = orig_j - j1;       % v

                Q11 = double(image(i1, j1, c));
                Q12 = double(image(i1, j2, c));
                Q21 = double(image(i2, j1, c));
                Q22 = double(image(i2, j2, c));
                
                R1 = (1 - dj) * Q11 + dj * Q12;
                R2 = (1 - dj) * Q21 + dj * Q22;

                P = (1 - di) * R1 + di * R2;

                counts(i, j, c) = uint8(P);
            end
        end
    end
end