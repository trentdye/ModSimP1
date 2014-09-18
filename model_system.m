function res = model_system(initialSharks, initialRays, initialScallops, initialYear, finalYear)
    clf;
    hold on;
    sharks = initialSharks;
    rays = initialRays;
    scallops = initialScallops;
    plot(initialYear, sharks, 'r*');
    plot(initialYear, rays, 'g*');
    plot(initialYear, scallops, 'b*');
    xlabel('Year');
    ylabel('Population');
    legend('Sharks','Rays','Scallops');
    for i=1:(finalYear-initialYear)
        update_model;
        plot(i+initialYear, sharks, 'r*');
        plot(i+initialYear, rays, 'g*');
        plot(i+initialYear, scallops, 'b*');
    end
end