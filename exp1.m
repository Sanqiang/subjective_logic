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

myhsv=[
1  0  0;
1 .1 .1;
1 .2 .2;
1 .3 .3;
1 .4 .4;
1 .5 .5;
1 .6 .6;
1 .7 .7;
1 .8 .8;
1 .9 .9;
0  1  0;
0  1 .1;
0  1 .2;
0  1 .3;
0  1 .4;
0  1 .5;
0  1 .6;
0  1 .7;
0  1 .8;
0  1 .9;
];
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
triple_aspect = generate_triple_aspect(m);

ax0 = subplot(4,1,1);
imagesc(m);
colormap(ax0,[0,1,0;1,1,0;1,0,0]);

ax1 = subplot(4,1,2);
imagesc(triple);
colormap(ax1,myhsv);

ax2 = subplot(4,1,3);
imagesc(triple_aspect);
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
triple_aspect = generate_triple_aspect(m);

ax0 = subplot(4,1,1);
imagesc(m);
colormap(ax0,[0,1,0;1,1,0;1,0,0]);

ax1 = subplot(4,1,2);
imagesc(triple);
colormap(ax1,myhsv);

ax2 = subplot(4,1,3);
imagesc(triple_aspect);
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
triple_aspect = generate_triple_aspect(m);

ax0 = subplot(4,1,1);
imagesc(m);
colormap(ax0,[0,1,0;1,1,0;1,0,0]);

ax1 = subplot(4,1,2);
imagesc(triple);
colormap(ax1,myhsv);

ax2 = subplot(4,1,3);
imagesc(triple_aspect);
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
triple_aspect = generate_triple_aspect(m);

ax0 = subplot(4,1,1);
imagesc(m);
colormap(ax0,[0,1,0;1,1,0;1,0,0]);

ax1 = subplot(4,1,2);
imagesc(triple);
colormap(ax1,myhsv);

ax2 = subplot(4,1,3);
imagesc(triple_aspect);
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
triple_aspect = generate_triple_aspect(m);

ax0 = subplot(4,1,1);
imagesc(m);
colormap(ax0,[0,1,0;1,1,0;1,0,0]);

ax1 = subplot(4,1,2);
imagesc(triple);
colormap(ax1,myhsv);

ax2 = subplot(4,1,3);
imagesc(triple_aspect);
colormap(ax2,myhsv);

ax3 = subplot(4,1,4);
area(generateMonitor(triple,10)');
colormap(ax3,myhsv);