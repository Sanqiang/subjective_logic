function m = generateMonitor(triple,ngroup)
n_reviewer = size(triple,2);
group_size = n_reviewer/ngroup;

m = zeros(4,ngroup);

for ngroup_idx = 1:ngroup
    
    triple_group = triple(:,(((ngroup_idx-1)*group_size)+1):(ngroup_idx*group_size));
    
    for idx = 1:group_size
        triple_item = triple_group(:,idx);
        
        if triple_item(3) > 0.6
            m(4,ngroup_idx) = m(4,ngroup_idx) + 1;
        elseif triple_item(2) > 0.4
            m(3,ngroup_idx) = m(3,ngroup_idx) + 1;
        elseif triple_item(1) > 0.4
            m(2,ngroup_idx) = m(2,ngroup_idx) + 1;
        else
            m(1,ngroup_idx) = m(1,ngroup_idx) + 1;
        end
    end
    

end

end