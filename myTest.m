function  myTest()
im = logical(imread('./db/brick-20.gif'));

teta = pi/4;

    
subplot(2,2,1);

    %Barycentre
    [bary_x, bary_y] = find(im==1);
    X=round(mean(bary_x));
    Y=round(mean(bary_y));
    %hold off;
    
    [r,pCX, pCY]=getSignature(X, Y, im,teta);
    pasTeta = 0:teta:2*pi;
    plot(pasTeta,r);
    title('Courbe de la signature de l image ');

subplot(2,2,2);

    imshow(im); hold on;
    plot(pCY, pCX, '.R');
    plot(Y,X, '+G');
    title('Affichage image');
    
subplot(2,2,4);
        [d]=descripteur(r);
        plot(d);
        title('Descripteur');

end