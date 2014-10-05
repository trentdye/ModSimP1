function res = simulationPlot()

    %CONSTANTS
    action = 0;
    stop = 10;
    yearStart = -10;
    [R, S] = simulation(stop-yearStart, 0, 4.5*10^7);
    [Rnew, Snew] = simulation(stop-yearStart, 1, 4.5*10^7);
    
    %GRAPH OPTIONS
    clf;
    hold on;
    set(gca, 'FontSize', 12); 
    
    %
    
    %GRAPH HISTORICAL RAY POPULATION
    subplot(2, 1, 1);
    load ray.csv;
    plot(ray(:,1)-34, ray(:, 2), 'g*', 'LineWidth', 3);
    
    %GRAPH HISTORICAL SCALLOP POPULATION
    subplot(2, 1, 2);
    load scallop.csv;
    plot(scallop(:,1)-32, scallop(:, 2), 'b*', 'LineWidth', 3);
    
    %
    %
    
    %RAY PLOT
    subplot(2, 1, 1)
    title('Ray and Scallop Populations over Time');
    hold on;
    plot(yearStart:(yearStart + length(R) - 1),R, 'r-', 'LineWidth', 3);
    if action == 1
        plot(yearStart:(yearStart + length(Rnew) - 1),Rnew, 'c-', 'LineWidth', 3);
        legend('Simulated Future','Simulated Future with Action');
    end
    xlabel('Time (Years)');
    ylabel('Ray Population (#)');
    xlim([yearStart stop]);
    
    %SCALLOP PLOT
    subplot(2, 1, 2)
    hold on;
    plot(yearStart:(yearStart + length(S) - 1),S, 'g-', 'LineWidth', 3);
    if action == 1
        plot(yearStart:(yearStart + length(Snew) - 1),Snew, 'm-', 'LineWidth', 3);
        legend('Simulated Future','Simulated Future with Action');
    end
    xlabel('Time (Years)');
    ylabel('Scallop Population (metric tons)');
    xlim([yearStart stop]);
end