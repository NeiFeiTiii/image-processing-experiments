function encoded = shannonenco(data, dict)
    encoded = '';
    for i = 1:length(data)
        idx = find(cell2mat(dict(:, 1)) == data(i));
        encoded = [encoded, dict{idx, 2}];
    end
end