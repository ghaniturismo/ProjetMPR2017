% Vecteur de distance renvoye : distance avec les bordures de l'image
function [D,pCY,pCX] = vecteur_DistanceAuBaricentre(xCentre, yCentre, img, teta)
    pCY = [];
    pCX = [];    

    Pas = 0:teta:2*pi;
    taille = size(Pas, 2);
    
    D = zeros(1, taille);
    
    for i=1 : taille
        [D(1, i),pY,pX] = getSignature(xCentre, yCentre,img, Pas(i));
        pCY=[pCY,pY];
        pCX=[pCX,pX];
    end
end