count = zeros(3,15);

for idx = 1:length(m)
    idx_count = 1+floor(idx/1000);
    if m(idx) == 1
        count(1,idx_count) = count(1,idx_count)+1;
    elseif m(idx) == 0
        count(2,idx_count) = count(2,idx_count)+1;
    else
        count(3,idx_count) = count(3,idx_count)+1;
    end
   
end