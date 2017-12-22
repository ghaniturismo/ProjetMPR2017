function D = descripteur(vDist_Barycentre,CoeffsAGarder)
    
    %Recuperation de la transformee de Fourier du vecteur de distance 
    %au barycentre
    F = fft(vDist_Barycentre);
    
    %Les fréquences faibles a garder 
    F = F(1:CoeffsAGarder);
    
    %Normalisation
    f0 = abs(F(1));
    D = abs(F) ./ f0; 
    
end