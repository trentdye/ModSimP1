%%
% 
% Input: integer 1-5
%
% Output: Vector of RGB values suitable as a color code.
%
% Example:
% plot(X, 'LineWidth', 4, 'Color', colorBrewer(3))

function res = col3(i)

    colors = [[17,47,65]
              [6,133,135]
              [82,176,114]
              [252,176,60]
              [252,78,45]] / 256;

    res = colors(i,:);
end

