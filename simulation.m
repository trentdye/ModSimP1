function [Rarr,Sarr] = simulation(stop, trigger, level)
    
    %CONSTANTS
    R(1) = 0.00051*2;
    S(1) = 0.3*0.5;
    
    carryR = 1;
    carryS = 1;
    rayBirthRate = 0.25; %natural net ray death rate
    scallopBirthRate = 0.2;
    
    rayKillScallopRate = 0.68;
    
    scallopChangeRate = 0.1;
    capR = 1;
    
    percentRaysToKill = .075;
    
    %MAIN LOOP
    for i=1:stop
        R(i+1) = R(i) + deltaR(R(i), S(i));
        if R(i+1) < 0.01
            R(i+1)=0.01;
        end

        S(i+1) = S(i) + deltaS(R(i), S(i));
        if S(i+1) < 0.01
            S(i+1)=0.01;
        end
    end
    
    Rarr = R;
    Sarr = S;
    
%% DELTA R

    function res = deltaR(r, s)
        if trigger == 0
            carryChange = rayBirthRate * (1- r/carryR) * r;
            res = carryChange;
        end
        if trigger == 1
            carryChange = rayBirthRate * (1- r/carryR) * r;
            if r > level
                carryChange = carryChange - percentRaysToKill*r;
            end
            res = carryChange;
        end
    end

%% DELTA S

    function res = deltaS(r, s)
        carryChange = scallopBirthRate*s*(1-s/carryS);
        carryChange = carryChange - rayKillScallopRate*r*s;
        if s > level && trigger == 1
            carryChange = carryChange + percentRaysToKill*r*2;
        end
        carryChange = carryChange + scallopChangeRate*s*(1-r/capR);
        res = carryChange;
    end
end