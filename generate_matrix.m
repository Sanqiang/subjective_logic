%add_column: if true add column otherwise add column row
%all idx if 0 ignore, therwise concrete index, percentage is how much
%percentage want to meet
function new_matrix = generate_matrix(old_matrix,add_column, percentage,... 
                                        agreement_col_idx, disagreement_col_idx,...
                                        agreement_row_idx,disagreement_row_idx)

n_reviewer = size(old_matrix,2);
n_aspect = size(old_matrix,1);

if add_column
    if agreement_col_idx > 0
        target_col = old_matrix(:,agreement_col_idx);
        n_target_col = length(target_col);
        idxs_same = datasample(1:n_target_col,round(n_target_col*percentage),'Replace',false);
        idxs_diff = setdiff(1:n_target_col,idxs_same);
        target_col(idxs_diff) = -1*target_col(idxs_diff);
        old_matrix(:,n_reviewer+1) = target_col;
    elseif disagreement_col_idx > 0
        target_col = old_matrix(:,disagreement_col_idx);
        n_target_col = length(target_col);
        idxs_same = datasample(1:n_target_col,round(n_target_col*percentage),'Replace',false);
        target_col(idxs_same) = -1*target_col(idxs_same);
        old_matrix(:,n_reviewer+1) = target_col;
    else
        target_col = round(rand(n_aspect,1)*2-1);
        old_matrix(:,n_reviewer+1) = target_col;
    end
else
    if agreement_row_idx > 0
        target_row = old_matrix(agreement_row_idx,:);
        n_target_row = length(target_row);
        idxs_same = datasample(1:n_target_row,round(n_target_row*percentage),'Replace',false);
        idxs_diff = setdiff(1:n_target_row,idxs_same);
        target_row(idxs_diff) = -1*target_row(idxs_diff);
        old_matrix(1+n_aspect,:) = target_row;
    elseif disagreement_row_idx > 0 
        target_row = old_matrix(disagreement_row_idx,:);
        n_target_row = length(target_row);
        idxs_same = datasample(1:n_target_row,round(n_target_row*percentage),'Replace',false);
        target_row(idxs_same) = -1*target_row(idxs_same);
        old_matrix(1+n_aspect,:) = target_row;
    else
        target_row = round(rand(1,n_reviewer)*2-1);
        old_matrix(1+n_aspect,:) = target_row;
    end
end

new_matrix = old_matrix;
end