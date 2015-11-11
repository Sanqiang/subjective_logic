%deprecated
function new_matrix = generate_matrix_prob(times,tuple_weight,n_aspects)

new_matrix = [];
%0 1 -1
tuple_weight = [
    9 8 7 6 5 4 4 3 3 1;
    1 2 3 4 5 6 7 8 9 10;
    1 1 1 1 2 2 2 3 3 3;
];
tuple_weight = bsxfun(@rdivide,tuple_weight,sum(tuple_weight));
tuple_weight = floor(tuple_weight*n_aspects);

n_group = size(tuple_weight,2);
group_size = round(times / n_group)

for time_idx = 1:times
    group_idx = floor(times / group_size)
    cur_weight = tuple_weight(:,group_idx);
    
    cnt_pos = cur_weight(1);
    cnt_neg = cur_weight(2);
    cnt_zero = n_aspects - cnt_pos - cnt_neg;
    
end


end
