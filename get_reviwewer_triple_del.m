%omega from reviewer1 to reviewer2
function triple = get_reviwewer_triple_del(data, reviewer1_idx, reviewer2_idx)
triple = {};

%contribute to uncertain case1
col1 = data(:,reviewer1_idx);
col2 = data(:,reviewer2_idx);
%complete_col1 = length(find(col1 ~= 0))/length(col1);
incomplete_col2 = length(find( col1 == 0 & col2 == 0))/length(col2);

%contribute to uncertain case2
incomplete_col1_col2 = length(find( col1 ~= 0 & col2 == 0))/length(col2);


triple.uncertain = log10(incomplete_col2+1) + incomplete_col1_col2;

%contribute to trust: complete/weight
aspects_n = size(data,1);
complete_row = [];
weight_row = [];
for aspect_i = 1:aspects_n
    row_i = data(aspect_i,:);
    complete_row(aspect_i) = length(find(row_i ~= 0))/length(row_i);
    if col1(aspect_i) > 0 && col2(aspect_i) > 0
        weight_row(aspect_i) = 1 / (1 + exp(length(find(row_i>0))/length(row_i)));
    elseif col1(aspect_i) < 0 && col2(aspect_i) < 0
        weight_row(aspect_i) = 1 / (1 + exp(length(find(row_i<0))/length(row_i)));
    elseif col1(aspect_i) == 0 || col2(aspect_i) == 0
        weight_row(aspect_i) = 0;
    else
        weight_row(aspect_i) = 1 / (1 + exp(1/2));
    end
end
weight_row = weight_row / sum(weight_row);
weight_row = complete_row .* weight_row;

%distance-based sim
sim = [];
for aspect_i = 1:aspects_n
    sim(aspect_i) = weight_row(aspect_i) * (1 - abs(col1(aspect_i) - col2(aspect_i)) / 2);
end
triple.trust = sum(sim);

triple.distrust = 1 - triple.trust - triple.uncertain;
end

