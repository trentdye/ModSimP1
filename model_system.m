function res = model_system(initialSharks, initialRays, initialScallops, initialYear, finalYear)
    hold on;
    sharks = initialSharks;
    rays = initialRays;
    scallops = initialScallops;
    plot(0, sharks, 'r*');
    plot(0, rays, 'g*');
    plot(0, scallops, 'b*');
    xlabel('Year');
    ylabel('Population');
    legend('Sharks','Rays','Scallops');
    for i=1:(finalYear-initialYear)
        update_model;
        plot(i, sharks, 'r*');
        plot(i, rays, 'g*');
        plot(i scallops, 'b*');
    end
end