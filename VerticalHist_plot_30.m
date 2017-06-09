%% complimentary to VerticalHist_main
% author: Teng Li, Version: 20170504
% 20170504 note: 文字加std；图加正态钟形曲线拟合;标题前空格数组控制

function VerticalHist_plot_30(fig_hd,nn,this_Vx, this_Vy, x_start,y_start, width,height,central_void ,ylim_max,front_size,title_space,drainages)
% activate specified figure according to handle
figure(fig_hd);
line_width = 0.5;
text_offset_x = 0.045;
text_offset_y = 0.87;
%% left histogram
left_axes = axes('Position', [x_start,y_start,width,height]);
% left_hist = histogram(this_Vx,ceil(numel(this_Vx)/10),'Orientation','horizontal');
left_hist = histogram(this_Vx,'Orientation','horizontal', 'Normalization', 'probability');
hold on 
set(left_hist, 'LineStyle','none','FaceColor','r','BinMethod','fd');
lgd_hd = legend('V_{x}', 'Location', 'southwest');
set(lgd_hd, 'FontSize',front_size);

ylim([-ylim_max, ylim_max]);
set(left_axes, 'XDir','reverse','FontSize',front_size);
set(left_axes, 'XTickMode', 'auto')
% ['Variance = ', num2str(std(this_Vx), '%4.2f')] 一处错误！
% 20170531note:这里的variance方差，我给的数字是标准差！
% 如果给RMSE=std / numel(data), 考虑到大数据量词值更小！
text_string = {['Mean = ', num2str(mean(this_Vx),'%4.2f')], ['Median = ', num2str(median(this_Vx),'%4.2f')],['Variance = ', num2str(std(this_Vx), '%4.2f')]};
text(text_offset_x, text_offset_y, text_string,'Units','normalized','FontSize',front_size)
title([title_space,upper(drainages{nn}(1)), drainages{nn}(2:end)]);
%% right histogram
right_axes = axes('Position',[(1-x_start-width),y_start,width,height]);
right_hist = histogram(this_Vy,'Orientation','horizontal', 'Normalization', 'probability');
set(right_hist, 'LineStyle','none','FaceColor','b','BinMethod','fd');
set(right_axes,'YAxisLocation','right','FontSize',front_size);
lgd_hd = legend('V_{y}','Location','southwest');
set(lgd_hd, 'FontSize',front_size);
ylim([-ylim_max, ylim_max]);
set(right_axes, 'XTickMode', 'auto')
text_string = {['Mean = ', num2str(mean(this_Vy),'%4.2f')], ['Median = ', num2str(median(this_Vy),'%4.2f')],['Variance = ', num2str(std(this_Vy), '%4.2f')]};
text(text_offset_x+0.1, text_offset_y, text_string,'Units','normalized','FontSize',front_size)
% horizontal zero reference line
zero_axes = axes('Position',[x_start,y_start, width*2+central_void, height]);
plot([0,1],[0.5,0.5],'LineWidth', line_width,'Color','k');
% title('total plot');
% text(0.5,5,'total plot')
set(zero_axes,'Visible','off');
end