x = ones(10,1);
for loop = 1:100
    x = generate_matrix_add_column(x,0.80,0);
end

for loop = 1:50
    x = generate_matrix_add_column(x,0.90,1);
end

for loop = 1:100
    x = generate_matrix_add_column(x,0.5,2);
end

%data
imagesc(x);

tuple_matrix = generate_triple(x);
print_triple(tuple_matrix);
imagesc(tuple_matrix);



