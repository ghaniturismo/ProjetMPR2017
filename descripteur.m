function D = descripteur(vDist_Baricentre)

    %nbCoeffsAGarder = 50;
        
    F = fft(vDist_Baricentre);
    D=F;
    %F = F(1:nbCoeffsAGarder); % On garde les fréquences faibles
    %f0 = abs(F(1)); % normaliser
    
    %D = abs(F) ./ f0;
end