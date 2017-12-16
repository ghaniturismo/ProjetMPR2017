function D = descripteur(vDist_Baricentre)

    nbCoeffsAGarder = 4;
    
    F = fft(vDist_Baricentre);
    
    F = F(1:nbCoeffsAGarder); % On garde les fréquences faibles
    f0 = abs(F(1)); % normaliser
    
    D = abs(F) ./ f0;

    % vDist_Baricentre=sort(vDist_Baricentre) % a ajouter dans le tests.m plus tard    
    
end