function [Rarr,Sarr] = simulation()
    
    %CONSTANTS
    stop = 10;
    R(1) = 40000000;
    S(1) = 100000;
    
    betaS = 0.03; %natural net scallop birth rate
    criticalS = 125000;
    
    gammaR = 0.5; %natural net ray birth rate
    criticalR = 4*10^7;
    
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
        lotkeChange = gammaR * (1- s/criticalS) * r;
        res = lotkeChange;
    end

%% DELTA S

    function res = deltaS(r, s)
        lotkeChange = betaS*(1-r/criticalR) * s;
        res = lotkeChange;
    end
end