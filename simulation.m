function [Rarr,Sarr] = simulation(stop, trigger, level)
    
    %CONSTANTS
    R(1) = 0.00056;
    S(1) = 0.3;
    
    carryR = 1.75;
    scallopBirthRate = 0.1;
    carryS = 2;
    rayBirthRate = 0.3; %natural net ray death rate
    rayKillScallopRate = 0.16;
    
    %MAIN LOOP
    for i=1:stop
        R(i+1) = R(i) + deltaR(R(i), S(i));
        if R(i+1) < 0
            R(i+1)=0;
        end

        S(i+1) = S(i) + deltaS(R(i), S(i));
        if S(i+1) < 0
            S(i+1)=0;
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
        if trigger == 1 %%not yet modified for carrying capacity
            lotkeChange = rayBirthRate * (1- r/carryR) * r;
            if r > level
                lotkeChange = lotkeChange - 0.02*r;
                res = lotkeChange;
            end
            res = lotkeChange;
        end
    end

%% DELTA S

    function res = deltaS(r, s)
        carryChange = scallopBirthRate*s*(1-s/carryS);
        carryChange = carryChange - rayKillScallopRate*r;
        res = carryChange;
    end
end