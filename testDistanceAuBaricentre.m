Img = logical(imread('dbq/Bone-1.gif'));

angle = 1;
bariX = 439.0/2;
bariY = 357.0/2;
d = distanceAuBaricentre(Img, bariX, bariY, angle);


Img(floor(bariY + d*sin(angle)), floor(bariX + d*cos(angle))) = 1;

figure;
imshow(Img);
drawnow();