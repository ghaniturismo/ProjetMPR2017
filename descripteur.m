function D = descripteur(vDist_Baricentre,CoeffsAGarder)
      
    F = fft(vDist_Baricentre);
    
    F = F(1:CoeffsAGarder); % les fréquences faibles
    f0 = abs(F(1)); % normaliser
    
    D = abs(F) ./ f0; 
    
end