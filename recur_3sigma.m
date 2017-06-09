%% shrink data within (mean+/-3*sigma) recursively
% author: TengLi; litengbnu@foxmial.com
function output = recur_3sigma(input)
% input vector = m*1, output vector = n*1, n<m
limit_min = mean(input)-3*std(input);
limit_max = mean(input)+3*std(input);
if min(input) < limit_min || max(input) > limit_max
    input(input<limit_min) = [];
    input(input>limit_max) = [];
    output = recur_3sigma(input);
else
    output = input;
end
end
