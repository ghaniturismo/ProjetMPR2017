function [d,pCX,pCY] = getSignature(xCentre, yCentre,img, teta)
    
    pCY = [];
    pCX = [];
    bool = false;
    positionX = xCentre;
    positionY = yCentre;
    pasX = cos(teta);
    pasY = sin(teta);    
    [tailleY, tailleX] = size(img);
    
    while (~ bool)
        positionX = positionX + pasX;
        positionY = positionY + pasY;
        if (positionX <= 1) || (positionX >= tailleX) || (positionY <= 1) || (positionY >= tailleY)
            bool = true;
        end
        if ~bool && ~img(floor(positionY), floor(positionX))
            bool = true;
        end
    pCY = positionY;
    pCX = positionX;  
        
    end
    
    %Calcul de la distance euclidienne entre position (x,y) et
    %(xCentre,yCentre)
    d = sqrt( (positionX - xCentre)^2 + (positionY - yCentre)^2 );
    
end
