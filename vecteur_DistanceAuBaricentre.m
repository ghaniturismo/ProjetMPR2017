% Renvoie un vecteur de distance: celle des limites de l'objet
function [D,pCY,pCX] = vecteur_DistanceAuBaricentre(x, y, Img, angle)
    pCY = [];
    pCX = [];    

    Pas = 0:angle:2*pi;
    taille = size(Pas, 2);
    
    D = zeros(1, taille);
    
    for i=1 : taille
        [D(1, i),pY,pX] = getSignature(x, y,Img, Pas(i));
        pCY=[pCY,pY];
        pCX=[pCX,pX];
    end
end