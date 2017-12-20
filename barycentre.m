% Calcule du barycentre d'une matrice (image) qui a des valeur 0 et 1.
function [y, x] = barycentre(img)

    %Barycentre
    [bary_x, bary_y] = find(img==1);
    x=round(mean(bary_x));
    y=round(mean(bary_y));

end