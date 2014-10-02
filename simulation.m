function [Rarr,Sarr] = simulation(stop, trigger, level)
    
    %CONSTANTS
    R(1) = 30000000;
    S(1) = 200000;
    hello = 1;
    
    betaS = 0.6; %natural net scallop birth rate
    criticalS = 156000000;
    
    gammaR = -0.7; %natural net ray death rate
    criticalR = 100000000;
    
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
        res = lotkeChange;
    end
end