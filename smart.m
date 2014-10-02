function res = smart()
    load ray.csv;
    load scallop.csv;
    rayDataX = ray(:,1);
    rayDataY = ray(:,2);
    scallopDataX = scallop(:,1);
    scallopDataY = scallop(:,2);
    
    %INITIALIZE BEST CASE
    bestError = 1000000;
    bestBeta = 0;
    bestCrit = 0;
    bestGamma = 0;
    
    %SET RANGES AND INCREMENTS
    betaSmin = 0;
    betaSmax = 1;
    betaSstep = 0.1;
    critSmin = 10^6;
    critSmax = 6*10^8;
    critSstep = 10^6;
    gammaRmin = -1;
    gammaRmax = 0;
    gammaRstep = 0.1;
    
    %CREATE SHORT SETS
    errorPoints = 10 %number of points on which to compute error for each iteration
    indexRayValues = round(linspace(1, length(rayDataX), errorPoints));
    indexScallopValues = round(linspace(1, length(scallopDataX), errorPoints));
    
    for i = 1:length(indexRayValues)
        shortSetRayX(i) = rayDataX(indexRayValues(i));
        shortSetRayY(i) = rayDataY(indexRayValues(i));
    end
    
    for i = 1:length(indexRayValues)
        shortSetRayX(i) = rayDataX(indexRayValues(i));
        shortSetRayY(i) = rayDataY(indexRayValues(i));
    end
    
    %CALCULATE ERROR
    
    % Insert plots
%     hold on;
%     plot(ray(:,1), ray(:,2));
%     plot(scallop(:,1),scallop(:,2));

    for betaS=betaSmin:betaSstep:betaSmax
        for critS = critSmin:critSstep:critSmax
            for gammaR = gammaRmin:gammaRstep:gammaRmax
                [R, S] = ezSim(betaS, critS, gammaR, 100000000);
                errorTotal = 0;
                for f = 1:length(shortSetRayX)
                    thisRayPop = R(shortSetRayX(i));
                    thisError = abs(thisRayPop - shortSetRayY(i));
                    errorTotal = errorTotal + thisError;
                end
                errorTotal = errorTotal / length(shortSetRayX);
                if(errorTotal < bestError)
                    bestError = errorTotal;
                    bestBeta = betaS;
                    bestCrit = critS;
                    bestGamma = gammaR;
                end
            end
            %disp(critS);
        end
        disp('One beta step done.');
    end

    res = [bestBeta, bestCrit, bestGamma];
    
    [X, Y] = ezSim(bestBeta, bestCrit, bestGamma);
    plot(X, Y);
end