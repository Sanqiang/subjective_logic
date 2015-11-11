function new_matrix = generate_matrix_add_column(old_matrix, percentage, agree_idx)

n_reviewer = size(old_matrix,2);
n_aspect = size(old_matrix,1);
if agree_idx == 0
    agree_idx = n_reviewer;
end

target_col = old_matrix(:,agree_idx);
n_target_col = length(target_col);
idxs_same = datasample(1:n_target_col,round(n_target_col*percentage),'Replace',false);
idxs_diff = setdiff(1:n_target_col,idxs_same);
%target_col(idxs_diff) = datasample([0,-1,1],length(idxs_diff));
target_col = target_col * -1;
old_matrix(:,n_reviewer+1) = target_col;
new_matrix = old_matrix;

end