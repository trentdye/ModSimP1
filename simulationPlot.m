function res = simulationPlot()
    [R, S] = simulation();
    
    clf;
    hold on;
    plot(R/R(1), 'ro-');
    plot(S/S(1), 'bs-');
    xlabel('Time (Years)');
    ylabel('Relative Population (% of Original)');
    legend('Rays','Scallops');
    set(gca, 'FontSize', 12); 
end