function tripe = generate_triple(m)

n_aspect = size(m,1);
n_reviewer = size(m,2);

mean_aspect = zeros(n_aspect,1);
zero_aspect = zeros(n_aspect,1);

for idx = 1:n_aspect
   mean_aspect(idx) = mean(m(idx,m(idx,:) ~= 0));
   zero_aspect(idx) = length(m(idx,m(idx,:) == 0)) / n_reviewer;
end

end