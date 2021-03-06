% define omega from reviewer1 to reviewer2
% regarding to two col/reviwers, for each row/aspect
% define complete, meaning proportion of nonzero elements.
% define weight, if agrees (both positive / both negative), use sigmoid(-1 * proportion of postive/negative elements)
% if disagree(one positive/one negative), use signmoid(-1/2)
% put complete into weight

% trust contributed from agreement, use distance-based similarity (because we want to incoporate weight into similarity measure)

% distrust contributed from disagreement, also use distance-based similarity.
% but using tan value, reason is we want to minimize the distance from 0.1
% to -0.1 but maxmize the distance from 0.9 to -0.9

%uncertain conteibuted from unknown elements for both reviewer1 and
%reviewer2, and unknown elements just for reviewer2 (higher weight).

%finally norm triples
function triple = get_reviwewer_triple(data, reviewer1_idx, reviewer2_idx)
triple = {};
col1 = data(:,reviewer1_idx);
col2 = data(:,reviewer2_idx);
uncertain_para = .5;
uncertain_weight = .6;

aspects_n = size(data,1);
%weight row/aspect
complete_row = zeros(aspects_n,1);
weight_row = zeros(aspects_n,1);
for aspect_i = 1:aspects_n
    row_i = data(aspect_i,:);
    complete_row(aspect_i) = length(find(row_i ~= 0))/length(row_i);
    if col1(aspect_i) > 0 && col2(aspect_i) > 0
        weight_row(aspect_i) = 1 / (1 + exp(length(find(row_i>0))/length(row_i)));
        weight_row(aspect_i) = weight_row(aspect_i) * complete_row(aspect_i);
    elseif col1(aspect_i) < 0 && col2(aspect_i) < 0
        weight_row(aspect_i) = 1 / (1 + exp(length(find(row_i<0))/length(row_i)));
        weight_row(aspect_i) = weight_row(aspect_i) * complete_row(aspect_i);
    elseif col1(aspect_i) == 0 || col2(aspect_i) == 0
        weight_row(aspect_i) = 0;
    else
        weight_row(aspect_i) = complete_row(aspect_i) .* 1 / (1 + exp(1/2));
    end
end
weight_row = weight_row / sum(weight_row);

agreement = zeros(aspects_n,1);
disagreement = zeros(aspects_n,1);
for aspect_i = 1:aspects_n
   if (col1(aspect_i) > 0 && col2(aspect_i) > 0) || (col1(aspect_i) < 0 && col2(aspect_i) < 0)
      agreement(aspect_i) = (1 - abs(col1(aspect_i) - col2(aspect_i))); 
      agreement(aspect_i) = agreement(aspect_i) * weight_row(aspect_i);
   elseif (col1(aspect_i) > 0 && col2(aspect_i) < 0) || col1(aspect_i) < 0 && col2(aspect_i) > 0
      disagreement(aspect_i) = abs(tan(col1(aspect_i)) - tan(col2(aspect_i)))/(tan(1) - tan(-1));
      disagreement(aspect_i) = disagreement(aspect_i) *  weight_row(aspect_i);   
   end
end
trust = sum(agreement);
distrust = sum(disagreement);

incomplete_col2 = length(find( col1 == 0 & col2 == 0))/length(col2);
incomplete_col1_col2 = length(find( col1 ~= 0))/length(col2);
uncertain = uncertain_weight*incomplete_col2 + (1-uncertain_weight)*incomplete_col1_col2;
uncertain = log(uncertain + 1) * uncertain_para;

triple.trust = trust / (trust + distrust + uncertain);
triple.distrust = distrust / (trust + distrust + uncertain);
triple.uncertain = uncertain / (trust + distrust + uncertain);

end