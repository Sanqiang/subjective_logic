function m = print_triple(m)

col_names = 'trust distrust uncertain';
n_reviewers = size(m,2);

row_names = mat2str(1:n_reviewers);
row_names = row_names(2:length(row_names)-1);

printmat(m,'',col_names,row_names);


end