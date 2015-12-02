trend_aspect1 = [
 3 2 1 .5 .1;
 3 1 1 1   1; 
 3 4 5 6   7];
trend_aspect1 = bsxfun(@rdivide,trend_aspect1,sum(trend_aspect1));

trend_aspect2 = [
 3 4 5 6   7;
 3 1 1 1   1; 
 3 2 1 .5 .1];
trend_aspect2 = bsxfun(@rdivide,trend_aspect2,sum(trend_aspect2));

trend_aspect3 = [
 3 4 3 3 3;
 3 3 3 3 6;
 3 3 5 3 3;
    ];
trend_aspect3 = bsxfun(@rdivide,trend_aspect3,sum(trend_aspect3));

myhsv = hsv;
myhsv = myhsv(1:22,:);
%exp1
%all entroy decrease
m = [
generate_single_aspect_matrix_based_on_trend(trend_aspect1,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect1,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect1,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect1,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect1,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect1,1000);
];
triple = generate_triple(m);

ax0 = subplot(4,1,1);
imagesc(m);
colormap(ax0,[0,1,0;1,1,0;1,0,0]);

ax1 = subplot(4,1,2);
imagesc(triple);
colormap(ax1,myhsv);

ax2 = subplot(4,1,3);
area(trend_aspect1');
colormap(ax2,myhsv);

ax3 = subplot(4,1,4);
area(generateMonitor(triple,10)');
colormap(ax3,myhsv);
%exp2

m = [
generate_single_aspect_matrix_based_on_trend(trend_aspect2,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect2,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect2,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect2,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect2,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect2,1000);
];
triple = generate_triple(m);
myhsv = hsv;
myhsv = myhsv(1:22,:);

ax0 = subplot(4,1,1);
imagesc(m);
colormap(ax0,[0,1,0;1,1,0;1,0,0]);

ax1 = subplot(4,1,2);
imagesc(triple);
colormap(ax1,myhsv);

ax2 = subplot(4,1,3);
area(trend_aspect2');
colormap(ax2,myhsv);

ax3 = subplot(4,1,4);
area(generateMonitor(triple,10)');
colormap(ax3,myhsv);


%exp3

m = [
generate_single_aspect_matrix_based_on_trend(trend_aspect1,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect1,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect1,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect2,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect2,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect2,1000);
];
triple = generate_triple(m);
myhsv = hsv;
myhsv = myhsv(1:22,:);

ax0 = subplot(4,1,1);
imagesc(m);
colormap(ax0,[0,1,0;1,1,0;1,0,0]);

ax1 = subplot(4,1,2);
imagesc(triple);
colormap(ax1,myhsv);

ax2 = subplot(4,1,3);
area(trend_aspect1');
colormap(ax2,myhsv);

ax3 = subplot(4,1,4);
area(generateMonitor(triple,10)');
colormap(ax3,myhsv);



%exp4
m = [
generate_single_aspect_matrix_based_on_trend(trend_aspect2,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect2,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect2,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect3,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect3,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect3,1000);
];
triple = generate_triple(m);
myhsv = hsv;
myhsv = myhsv(1:22,:);

ax0 = subplot(4,1,1);
imagesc(m);
colormap(ax0,[0,1,0;1,1,0;1,0,0]);

ax1 = subplot(4,1,2);
imagesc(triple);
colormap(ax1,myhsv);

ax2 = subplot(4,1,3);
area(trend_aspect2');
colormap(ax2,myhsv);

ax2 = subplot(4,1,4);
area(trend_aspect3');
colormap(ax2,myhsv);

ax3 = subplot(4,1,4);
area(generateMonitor(triple,10)');
colormap(ax3,myhsv);

%exp5

m = [
generate_single_aspect_matrix_based_on_trend(trend_aspect3,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect3,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect3,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect3,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect3,1000);
generate_single_aspect_matrix_based_on_trend(trend_aspect3,1000);
];
triple = generate_triple(m);
myhsv = hsv;
myhsv = myhsv(1:22,:);

ax0 = subplot(4,1,1);
imagesc(m);
colormap(ax0,[0,1,0;1,1,0;1,0,0]);

ax1 = subplot(4,1,2);
imagesc(triple);
colormap(ax1,myhsv);

ax2 = subplot(4,1,3);
area(trend_aspect3');
colormap(ax2,myhsv);

ax3 = subplot(4,1,4);
area(generateMonitor(triple,10)');
colormap(ax3,myhsv);
