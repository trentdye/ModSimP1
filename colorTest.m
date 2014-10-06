% To use color schemes in code example:
% plot(X, 'LineWidth', 4, 'Color', colorBrewer(3))

length = 5;
hold on;
clf;
for i = 1:length
    plot([1 10],[i i+10], 'linewidth', 4, 'color', col3(i));
end
title('col3');