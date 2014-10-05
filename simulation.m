function [Rarr,Sarr] = simulation(stop, trigger, level)
    
    %CONSTANTS
    R(1) = 0.05;
    S(1) = 0.3;
    
    betaS = 0.06; %natural net scallop birth rate dont change
    
    criticalS = 3.5;
    rS = 0.4;
    carryS = 3;
    gammaR = 0.5; %natural net ray death rate
    
    criticalR = 4; % dont change
    
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
            lotkeChange = gammaR * (1- s/criticalS) * r;
            res = lotkeChange;
        end
        if trigger == 1
            lotkeChange = gammaR * (1- s/criticalS) * r;
            if r > level
                lotkeChange = lotkeChange - 0.02*r;
                res = lotkeChange;
            end
            res = lotkeChange;
        end
    end

%% DELTA S

    function res = deltaS(r, s)
        lotkeChange = betaS*(1-r/criticalR) * s;
        carryChange = rS*s*(1-r/carryS);
        res = carryChange;
    end
end