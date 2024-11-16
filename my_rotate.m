function counts = my_rotate(image, radi)
    radi = radi * pi / 180;
    [height, width, channels] = size(image);

    center_x = (height + 1) / 2;
    center_y = (width + 1) / 2;

    new_height = ceil(abs(height * cos(radi)) + abs(width * sin(radi)));
    new_width = ceil(abs(height * sin(radi)) + abs(width * cos(radi)));
    counts = zeros(new_height, new_width, channels, 'uint8');

    new_center_x = (new_height + 1) / 2;
    new_center_y = (new_width + 1) / 2;

    for c = 1:channels
        for i = 1:new_height
            for j = 1:new_width
                x = (i - new_center_x) * cos(radi) + (j - new_center_y) * sin(radi) + center_x;
                y = -(i - new_center_x) * sin(radi) + (j - new_center_y) * cos(radi) + center_y;

                i1 = floor(x);
                i2 = min(i1 + 1, height);
                j1 = floor(y);
                j2 = min(j1 + 1, width);

                if i1 >= 1 && i1 <= height && j1 >= 1 && j1 <= width && i2 >= 1 && i2 <= height && j2 >= 1 && j2 <= width
                    di = x - i1;
                    dj = y - j1;

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
end