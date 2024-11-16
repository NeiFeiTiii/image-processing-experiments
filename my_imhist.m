function counts = my_imhist(image) % return counts
    counts = zeros(256, 1);
    [height,width]=size(image);
    for i = 1:height
        for j = 1:width          % add 1 to improve x-axis
           counts(image(i,j)+1) = counts(image(i,j)+1)+1;
        end
    end
end



