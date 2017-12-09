% recall et precision sont des matrices  de tailles identiques num_ref X 19 
% où num_ref est le nombre d'objets de référence (le nombre d'images requêtes) 
% et 19 est le nombre d'images à retrouver pour chaque requête

function [recall, precision] = tests()
img_db_path = './db/';
img_db_list = glob([img_db_path, '*.gif']);
img_db = cell(1);
label_db = cell(1);
fd_db = cell(1);
figure();
for im = 1:numel(img_db_list);
    img_db{im} = logical(imread(img_db_list{im}));
    %Barycentre
   	[X,Y]=find(img_db{im}==1);
    
    A=round(mean(X));
    B=round(mean(Y));
    v1=[X,Y];
    label_db{im} = get_label(img_db_list{im});
    clf;imshow(img_db{im});
    
    hold on;
    plot(B,A,'*r');
    v2=round(imcontour(img_db{im},3));
    
    d = sqrt(sum( (v1 - v2).^2 ));
    disp(d);
    disp(label_db{im});
    drawnow();
    waitforbuttonpress
end