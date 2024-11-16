function [dict, avglen] = shannonfano(symbols, prob)
    function codes = shannonfano_recursive(symbols, prob)
        if length(symbols) == 1
            codes = {''};
            return;
        end
        [~, idx] = sort(prob, 'descend');
        symbols = symbols(idx);
        prob = prob(idx);
        total = sum(prob);
        cum_prob = cumsum(prob);
        % find Split Index
        diff = abs(cum_prob - total / 2);
        [~, split_idx] = min(diff);
        
        left_symbols = symbols(1:split_idx);
        right_symbols = symbols(split_idx+1:end);
        left_codes = shannonfano_recursive(left_symbols, prob(1:split_idx));
        right_codes = shannonfano_recursive(right_symbols, prob(split_idx+1:end));
        codes = cell(size(symbols));
        for i = 1:split_idx
            codes{idx(i)} = ['0', left_codes{i}];
        end
        for i = split_idx+1:length(symbols)
            codes{idx(i)} = ['1', right_codes{i-split_idx}];
        end
    end

    codes = shannonfano_recursive(symbols, prob);
    dict = [num2cell(symbols(:)), codes(:)];
    a = cellfun('length', codes);
    b = prob';
    avglen = sum(a .* b);
end