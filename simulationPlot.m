function res = simulationPlot()

    %CONSTANTS
    stop = 0;
    yearStart = -40;
    [R, S] = simulation(stop-yearStart, 0, 0.8);
    [Rnew, Snew] = simulation(stop-yearStart, 1, 0.8);
    
    
    action = 0;
    
    %GRAPH OPTIONS
    clf;
    hold on;
    set(gca, 'FontSize', 13); 
    
    %
    
    %GRAPH HISTORICAL RAY POPULATION
    subplot(2, 1, 1);
    load ray2.csv;
    plot(ray2(:,1)-44, ray2(:, 2), 'g.', 'LineWidth', 1, 'Color', col3(5));
    
    %GRAPH HISTORICAL SCALLOP POPULATION
    subplot(2, 1, 2);
    load scallop.csv;
    plot(scallop(:,1)-42, scallop(:, 2), 'b.', 'LineWidth', 1, 'Color', col3(2));
    
    %
    %
    
    %RAY PLOT
    subplot(2, 1, 1)
    title('Ray and Scallop Population vs. Time');
    hold on;
    plot(yearStart:(yearStart + length(R) - 1),R, 'r-', 'LineWidth', 3, 'Color', col3(3));
    if action == 1
        plot(yearStart:(yearStart + length(Rnew) - 1),Rnew, 'c-', 'LineWidth', 3, 'Color', col3(5));
        legend('Simulated Future','Simulated Future with Action');
    end
    %xlabel('Time (Years)');
    ylabel('Relative Ray Population');
    xlim([yearStart stop]);
    
    %SCALLOP PLOT
    subplot(2, 1, 2)
    hold on;
    plot(yearStart:(yearStart + length(S) - 1),S, 'g-', 'LineWidth', 3, 'Color', col3(4));
    if action == 1
        plot(yearStart:(yearStart + length(Snew) - 1),Snew, 'm-', 'LineWidth', 3, 'Color', col3(5));
        legend('Simulated Future','Simulated Future with Action');
    end
    xlabel('Year Relative to Present (2014)');
    ylabel('Relative Scallop Population');
    xlim([yearStart stop]);
    ylim([0 1.5]);
end