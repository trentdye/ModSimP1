function res = punchline()

    %CONSTANTS
    action = 1;
    stop = 30;
    yearStart = -20;
    [R, S] = simulation(stop+40, 0, 0.3);
    [Rnew, Snew] = simulation(stop+40, 1, 0.3);
    
    %GRAPH OPTIONS
    clf;
    hold on;
    set(gca, 'FontSize', 13);
    history = 0; %turn historical reference on and off

    
    
    %
    if history == 1
        %GRAPH HISTORICAL RAY POPULATION
        subplot(2, 1, 1);
        load ray2.csv;
        plot(ray2(:,1)-44, ray2(:, 2), 'g.', 'LineWidth', 1, 'Color', col3(5));

        %GRAPH HISTORICAL SCALLOP POPULATION
        subplot(2, 1, 2);
        load scallop.csv;
        plot(scallop(:,1)-42, scallop(:, 2), 'b.', 'LineWidth', 1, 'Color', col3(2));
    end
    %
    %
    
    %RAY PLOT
    subplot(2, 1, 1)
    title('Ray and Scallop Population vs. Time');
    hold on;
    plot((1:length(R))-40,R, 'r-', 'LineWidth', 3, 'Color', col3(3));
    if action == 1
        plot((1:length(Rnew))-40,Rnew, 'c-', 'LineWidth', 3, 'Color', col3(4));
        legend('Without Action','With Action');
    end
    %xlabel('Time (Years)');
    ylabel('Relative Ray Population');
    xlim([-20 30]);
    ylim([0, 1.5]);
    
    %SCALLOP PLOT
    subplot(2, 1, 2)
    hold on;
    plot((1:length(S))-40,S, 'g-', 'LineWidth', 3, 'Color', col3(5));
    if action == 1
        plot((1:length(Snew))-40,Snew, 'm-', 'LineWidth', 3, 'Color', col3(2));
        legend('Without Action','With Action');
    end
    xlabel('Year Relative to Present');
    ylabel('Relative Scallop Population');
    xlim([-20 30]);
    ylim([0 1.5]);
end