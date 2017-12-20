function  myTest()

im = logical(imread('./db/apple-12.gif'));

teta = pi/16;

subplot(2,3,1);

    %Barycentre
    [Y,X] = barycentre(im);
    
    [r,pCY,pCX]=vecteur_DistanceAuBaricentre(X, Y, im,teta);
    
    pasTeta = 0:teta:2*pi;
    plot(pasTeta,r);
    title('Courbe de la signature de l image ');

subplot(2,3,2);

    imshow(im); hold on;
    plot(pCY, pCX, '.R');
    plot(Y,X, '+G');
    title('Affichage image');
    
subplot(2,3,3);
        [d]=vecteur_Descripteur(r,teta);
        plot(d);
        title('Descripteur');

        
        
%                                               Image requête
% *********************************************************************************************************
% *********************************************************************************************************
% *********************************************************************************************************
% *********************************************************************************************************


    imReq = logical(imread('./dbq/apple-1.gif'));
    


   % [resDescr, indiceLabel, nomLabel] = triDistEuclidienne(vReq, mDescr, label_db);        
    
subplot(2,3,4);

    [Y,X] = barycentre(imReq);
    [vReq,pCYreq,pCXreq]=vecteur_DistanceAuBaricentre(X, Y, imReq,teta);
    
    pasTeta = 0:teta:2*pi;
    plot(pasTeta,vReq);
    title('Courbe de la signature de l image ');

subplot(2,3,5);

    imshow(imReq); hold on;
    plot(pCYreq, pCXreq, '.R');
    plot(Y,X, '+G');
    title('Affichage image');
    
subplot(2,3,6);
        [d2]=vecteur_Descripteur(vReq,teta);
        plot(d2);
        title('Descripteur');
    
end