function D = descripteur(vDist_Baricentre,teta)

    %nbCoeffsAGarder = 2;
    Coeffs = round((2.0*pi/teta) * 0.5);
        
    F = fft(vDist_Baricentre);
    
    F = F(1:Coeffs); % les fréquences faibles
    f0 = abs(F(1)); % normaliser
    
    D = abs(F) ./ f0;

    % vDist_Baricentre=sort(vDist_Baricentre) % a ajouter dans le tests.m plus tard    
    
end