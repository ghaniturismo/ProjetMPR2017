function  myTest()
    clc;
    im = logical(imread('./db/apple-3.gif'));
    %Barycentre

    [bary_x, bary_y]=find(im==1);
    X=round(mean(bary_x));
    Y=round(mean(bary_y));
    
    imshow(im);
    hold on;
    plot(Y, X , '+R');
    getSignature(X, Y, im);
end