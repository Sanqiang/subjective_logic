function triple = generate_triple_aspect(m)

n_aspct = size(m,1);
triple = zeros(3,n_aspct);

for aspect_ind = 1:n_aspct
   m_aspect = m(aspect_ind,:);
   c_zero = 1+sum(m_aspect == 0);
   c_pos = 1+sum(m_aspect == 1);
   c_neg = 1+sum(m_aspect == -1);
   c_all = 3+length(m_aspect);
   
   triple(3,aspect_ind) = c_zero / c_all;
   
   entropy = -1/2*(c_pos / (c_pos + c_neg) * log(c_pos / (c_pos + c_neg)) + c_neg / (c_pos + c_neg) * log(c_neg / (c_pos + c_neg)));
   triple(2,aspect_ind) = entropy;
   triple(1,aspect_ind) = 1 - triple(2,aspect_ind) - triple(3,aspect_ind);
end

triple = bsxfun(@rdivide,triple,sum(triple));

end