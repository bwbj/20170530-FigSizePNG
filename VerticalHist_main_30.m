% to plot two vertical histogram with base root against each other
% Author: Teng Li; Version: 20170525
% general idea: construct left and right 
% 20170530note: not fitting this time;
%% read and orgnize data from tiff images
close
clear
data_path = 'D:\20161228-after AGU\minus\tiff\';
save_path = 'd:\2017-new year\violin_3sigma\20170540-FigSizePNG\';
cd(fullfile(save_path))
drainages_file = {'amundsen','filchner_ronne','lambert','peninsula','ross','wilkes'};
% drainages_file = {'amundsen'};
drainages_plot = {'Amundsen','Filchner Ronne','Lambert','Peninsula','Ross','Wilkes'};
data = cell(1,numel(drainages_file));
for nn = 1: numel(drainages_file)
    [temp_data,~] = geotiffread([data_path,'minus_',drainages_file{nn},'.tif']);
    data{nn} = non_all(temp_data);
end
%% to plot: http://www.duxuan.cn/doc/16077685.html
central_void = 0.0000005;
x_start = 0.1;
y_start = 0.1;
width = (1-2*x_start-central_void)/2;
height = 0.8;
ylim = 300;
title_space_num = 10;
title_space = repmat(' ',1,title_space_num);
title_space_cell = {repmat(' ',1,33), repmat(' ',1 ,31),repmat(' ',1, 33),repmat(' ',1,33),repmat(' ',1, 36),repmat(' ',1,35)};
front_size = 7.5;
fig_width = 6.5;
fig_height = 6;

for nn = 1:6
    [this_Vx,this_Vy] = deal(data{nn}(:,1),data{nn}(:,2));
    this_Vx = double(this_Vx); this_Vy = double(this_Vy);
    this_Vx_sigma = recur_3sigma(this_Vx);
    this_Vy_sigma = recur_3sigma(this_Vy);   
    fig = figure('units', 'centimeters', 'position', [10, 10, fig_width, fig_height], 'PaperPositionMode', 'auto');
    VerticalHist_plot_30(fig,nn,this_Vx_sigma, this_Vy_sigma, x_start,y_start,width,...
        height,central_void ,ylim,front_size,title_space_cell{nn}, drainages_plot)
    save_fig_sigma = ['Hist_',drainages_file{nn},'_simga.png'];
    print(fig,fullfile(save_path, save_fig_sigma),'-dpng','-r300')    
    
    fig2 = figure('units', 'centimeters', 'position', [10, 10, fig_width, fig_height], 'PaperPositionMode', 'auto');
%     set(fig,'Position', [300,200,550,450])
    VerticalHist_plot_30(fig2,nn,this_Vx, this_Vy, x_start,y_start,width,...
        height,central_void ,ylim,front_size,title_space_cell{nn}, drainages_plot)    
    save_fig = ['Hist_',drainages_file{nn},'.png'];
    print(fig2,fullfile(save_path, save_fig),'-dpng','-r300')
end
