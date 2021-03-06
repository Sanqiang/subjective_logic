function tripe = generate_triple(m)

n_aspect = size(m,1);
n_reviewer = size(m,2);
tripe = zeros(3,n_reviewer);

mean_aspect = zeros(n_aspect,1);
zero_aspect = zeros(n_aspect,1);
pos_aspect = zeros(n_aspect,1);
neg_aspect = zeros(n_aspect,1);

for idx = 1:n_aspect
   mean_aspect(idx) = mean(m(idx,m(idx,:) ~= 0));
   zero_aspect(idx) = length(m(idx,m(idx,:) == 0));
   pos_aspect(idx) = length(m(idx,m(idx,:) == 1));
   neg_aspect(idx) = length(m(idx,m(idx,:) == -1));
end

for idx_reviewer = 1:n_reviewer
    temp_tripe = zeros(3,n_aspect);
    for idx_aspect = 1:n_aspect
        if m(idx_aspect,idx_reviewer) == 1
            temp_tripe(1,idx_aspect) = pos_aspect(idx_aspect) / (pos_aspect(idx_aspect)+neg_aspect(idx_aspect));
            temp_tripe(2,idx_aspect) = neg_aspect(idx_aspect) / (pos_aspect(idx_aspect)+neg_aspect(idx_aspect));
            temp_tripe(3,idx_aspect) = (zero_aspect(idx_aspect)+min(pos_aspect(idx_aspect),neg_aspect(idx_aspect)))/(pos_aspect(idx_aspect)+neg_aspect(idx_aspect)+zero_aspect(idx_aspect)); 
        elseif m(idx_aspect,idx_reviewer) == -1
            temp_tripe(1,idx_aspect) = neg_aspect(idx_aspect) / (pos_aspect(idx_aspect)+neg_aspect(idx_aspect));
            temp_tripe(2,idx_aspect) = pos_aspect(idx_aspect) / (pos_aspect(idx_aspect)+neg_aspect(idx_aspect));
            temp_tripe(3,idx_aspect) = (zero_aspect(idx_aspect)+min(pos_aspect(idx_aspect),neg_aspect(idx_aspect)))/(pos_aspect(idx_aspect)+neg_aspect(idx_aspect)+zero_aspect(idx_aspect)); 
        else
            temp_tripe(:,idx_aspect) = [0,0,1];
        end
    end
    temp_tripe = bsxfun(@rdivide,temp_tripe,sum(temp_tripe));
    reviewer_triple = temp_tripe(:,1);
    for idx_aspect = 2:n_aspect
        reviewer_triple = intersect_sl(reviewer_triple,temp_tripe(:,idx_aspect));
    end
    tripe(:,idx_reviewer) = reviewer_triple;
end

end