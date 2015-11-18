function m = generate_matrix_based_on_trend(trend,n_review,n_aspect)

trend = bsxfun(@rdivide,trend,sum(trend));
n_group = size(trend,2);
group_size = floor(n_review/n_group);

m = zeros(n_aspect,n_review);

for i_group = 1:n_review
    reviewr_col = zeros(n_aspect,1);
    idx_group = min(1+floor(i_group/group_size),n_group);
    cur_trend = trend(:,idx_group);
    prob_pos = cur_trend(1);
    prob_neg = cur_trend(3);
    n_pos = floor(n_aspect*prob_pos);
    n_neg = floor(n_aspect*prob_neg);
    idx = datasample(1:n_aspect,n_aspect,'Replace',false);
    idx_pos = idx(1:n_pos);
    idx_neg = idx((1+n_pos):(1+n_pos+n_neg));
    reviewr_col(idx_pos) = 1;
    reviewr_col(idx_neg) = -1;
    m(:,i_group) = reviewr_col;
end




end