function triple = get_reviwewer_aspect_triple(data, reviewer_idx, aspect_idx)
triple = {};

col = data(:,reviewer_idx);
row = data(aspect_idx, :);
val = data(aspect_idx,reviewer_idx);
weight_bias = .6;

incomplete_col = length(find(col == 0))/length(col);
incomplete_row = length(find(row == 0))/length(row);

col_pos = length(find(col > 0))/length(find(col ~= 0));
row_pos = length(find(row > 0))/length(find(row ~= 0));

trust = 0;
distrust = 0;

uncertain_bias = 0;
if val > 0
   trust = tan(val);
   uncertain_bias = (col_pos+row_pos)/2;
elseif val < 0
   distrust = -tan(val);
   uncertain_bias = (1-col_pos+1-row_pos)/2;
end


uncertain = (weight_bias*uncertain_bias + (1-weight_bias)*(incomplete_col + incomplete_row)/2)/2;

triple.trust = trust / (trust + distrust + uncertain);
triple.distrust = distrust / (trust + distrust + uncertain);
triple.uncertain = uncertain / (trust + distrust + uncertain);

end