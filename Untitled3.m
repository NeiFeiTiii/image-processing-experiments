% 生成一个7x7的图像子块
image_block = [0,0,2,2,2,2,7;
               0,0,0,2,2,2,7;
               1,1,2,6,6,6,7;
               4,3,3,5,5,5,7;
               4,3,3,5,5,5,5;
               5,4,5,5,5,5,5;
               5,5,5,5,5,5,5];

% 计算概率分布
unique_vals = unique(image_block);
counts = histcounts(image_block(:), [unique_vals; max(unique_vals)+1]);
prob = counts / numel(image_block);

% Huffman编码
[dict, avglen_huffman] = huffmandict(unique_vals, prob);
huffman_encoded = huffmanenco(image_block(:), dict);

% 输出每一个值对应的哈夫曼编码
fprintf('哈夫曼编码:\n');
for i = 1:length(dict)
    symbol = dict{i, 1};
    code = dict{i, 2};
    fprintf('值 %d: %s\n', symbol, num2str(code));
end

% 费诺-香农编码
[shannon_dict, avglen_shannon] = shannonfano(unique_vals, prob);
shannon_encoded = shannonenco(image_block(:), shannon_dict);

fprintf('费诺-香农编码:\n');
for i = 1:length(shannon_dict)
    symbol = shannon_dict{i, 1};
    code = shannon_dict{i, 2};
    fprintf('值 %d: %s\n', symbol, code);
end

% 计算压缩比
original_size = numel(image_block) * 3; % 原始图像大小（比特）
huffman_size = numel(huffman_encoded); % Huffman编码后的大小（比特）
shannon_size = length(shannon_encoded); % 费诺-香农编码后的大小（比特）

huffman_compression_ratio = original_size / huffman_size;
shannon_compression_ratio = original_size / shannon_size;

% 计算编码效率
huffman_efficiency = avglen_huffman / entropy(prob);
shannon_efficiency = avglen_shannon / entropy(prob);

% 输出结果
fprintf('Huffman编码效率: %.2f\n', huffman_efficiency);
fprintf('Huffman压缩比: %.2f\n', huffman_compression_ratio);
fprintf('Huffman编码后的总位数: %d\n', huffman_size);
fprintf('费诺-香农编码效率: %.2f\n', shannon_efficiency);
fprintf('费诺-香农压缩比: %.2f\n', shannon_compression_ratio);
fprintf('费诺-香农编码后的总位数: %d\n', shannon_size);