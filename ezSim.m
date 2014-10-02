function [Rarr,Sarr] = ezSim(myBetaS, myCriticalS, myGammaR, myCriticalR)
    
    %CONSTANTS
    R(1) = 500;
    S(1) = 500;
    
    betaS = myBetaS; %natural net scallop birth rate
    criticalS = myCriticalS;
    
    gammaR = myGammaR; %natural net ray death rate
    criticalR = myCriticalR;
    
    stop = 35;
    
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