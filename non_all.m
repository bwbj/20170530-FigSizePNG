%% take out all Non-NaN and save in one dimension
% 输入5band minus image,分层取出有值区域分波段存为一列
% liteng 20161218
function [output] = non_all(input)
    band1 = input(:,:,1); temp1 = (band1 ~= band1(1));
    band2 = input(:,:,2); temp2 = (band2 ~= band2(1));
    band3 = input(:,:,3); temp3 = (band3 ~= band3(1));
    band4 = input(:,:,4); temp4 = (band4 ~= band4(1));
    temp = (temp1 & temp2 &temp3 & temp4);
    
    output(:,1) = band1(temp);
    output(:,2) = band2(temp);
    output(:,3) = band3(temp);
    output(:,4) = band4(temp);