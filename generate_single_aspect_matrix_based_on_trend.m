function m = generate_single_aspect_matrix_based_on_trend(trend,n_review)

trend = bsxfun(@rdivide,trend,sum(trend));
n_group = size(trend,2);
group_size = floor(n_review/n_group);

m = zeros(1,n_review);
%pdf = makedist('Uniform','lower',0,'upper',1);

for i_group = 1:n_review
    idx_group = min(1+floor(i_group/group_size),n_group);
    cur_trend = trend(:,idx_group);
    prob_pos = cur_trend(1);
    prob_zero = cur_trend(2);
    prob_neg = cur_trend(3);
    
    %r = random(pdf);
    r = rand();
    if r <= prob_pos
        target = 1;
    elseif r <= prob_zero+prob_pos
        target = 0;
    else
        target = -1;
    end
    
    m(:,i_group) = target;
end




end