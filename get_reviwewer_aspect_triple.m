% trust/distrust can be interpret as like/dislike otherwise it's meaningless
% to say reviewer trust aspect
% use tan for maximize the trust level for 0.9, lower level for 0.1

% uncertain come from incomplete for col/row and bias for col/row (weight higher)

function triple = get_reviwewer_aspect_triple(data, aspect_idx, reviewer_idx)
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
   trust = tan(val) / tan(1) ;
   uncertain_bias = (col_pos+row_pos)/2;
elseif val < 0
   distrust = -tan(val) / tan(1);
   uncertain_bias = (1-col_pos+1-row_pos)/2;
end


uncertain = (weight_bias*uncertain_bias + (1-weight_bias)*(incomplete_col + incomplete_row)/2)/2;

triple.trust = trust / (trust + distrust + uncertain);
triple.distrust = distrust / (trust + distrust + uncertain);
triple.uncertain = uncertain / (trust + distrust + uncertain);

end