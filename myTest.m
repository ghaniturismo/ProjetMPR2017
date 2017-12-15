function  myTest()
im = logical(imread('./db/apple-3.gif'));

    subplot(2,2,1);
    clc;
    %Barycentre
    [bary_x, bary_y] = find(im==1);
    X=round(mean(bary_x));
    Y=round(mean(bary_y));
    %hold off;
    [r,teta, pCX, pCY]=getSignature(X, Y, im);
    
    plot(teta, r);
    
    title('Courbe de la signature de l image ');

subplot(2,2,2);

imshow(im); hold on;
plot(pCY, pCX, '.R');
plot(Y,X, '+G');
title('Affichage image');

%subplot(2,2,3);
%y3 = sin(4*x);
%plot(x,y3);
%title('Subplot 3: sin(4x)');

%subplot(2,2,4);
%y4 = sin(8*x);
%plot(x,y4);
%title('Subplot 4: sin(8x)');

end