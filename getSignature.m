function [d,pCX,pCY] = getSignature(XCentre, YCentre,img, teta)
    
    pCY = [];
    pCX = [];
    bool = false;
    positionX = XCentre;
    positionY = YCentre;
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
    
    d = sqrt( (positionX - XCentre)^2 + (positionY - YCentre)^2 );
    
end
