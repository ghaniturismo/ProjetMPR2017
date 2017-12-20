function [k,pointContourX, pointContourY] = anc_getSignature(XCentre, YCentre, img,teta)
    k=0;
    r=[];
    pointContourX = [];
    pointContourY = [];
    tmpXC=0;
    tmpYC=0;
    
    [sizeY, sizeX] = size(img);

    for pasTeta = 0:teta:2*pi % 0:10:360
        % Cherche le point du contour
        i = 1;
        
        while ( round(XCentre + i * cos(pasTeta)) < sizeY && round(XCentre + i * cos(pasTeta)) > 0 ) && ( round(YCentre + i * sin(pasTeta)) < sizeX && round(YCentre + i * sin(pasTeta)) > 0 ) && ( img(round(XCentre + i * cos(pasTeta)), round(YCentre + i * sin(pasTeta))) == 1 )
              
            i = i + 1; % pas du deplacement sur la droite pour aller au contour
            tmpXC = round(XCentre + i * cos(pasTeta));
            tmpYC = round(YCentre + i * sin(pasTeta));   
        end
                
        pointContourX(end+1) = tmpXC;
        pointContourY(end+1) = tmpYC;
        
        k=[r,dist_euclide_Baricentre(XCentre, YCentre,pointContourX,pointContourY)];
    end
    
end