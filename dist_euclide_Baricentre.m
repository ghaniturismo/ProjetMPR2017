% Distance d'un point limite(contour) par rapport au baricentre

function [d] = dist_euclide_Baricentre(x, y, pCX,pCY)
   
    d = sqrt((pCX - x).^2 + (pCY - y).^2);

end