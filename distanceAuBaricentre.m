% Renvoie la distance d'un point limite de l'objet par rapport au
% baricentre
function [d] = distanceAuBaricentre(Img, x, y, angle)
    trouve = false;
    unitaireX = cos(angle);
    unitaireY = sin(angle);
    posX = x;
    posY = y;
    
    [tailleY, tailleX] = size(Img);
    
    while (~ trouve)
        posX = posX + unitaireX;
        posY = posY + unitaireY;
        if ~Img(floor(posY), floor(posX))
            trouve = true;
        end
        if posX > tailleX || posY > tailleY
            trouve = true;
        end
    end
    
    d = sqrt( (posX - x)^2 + (posY - y)^2 );
end