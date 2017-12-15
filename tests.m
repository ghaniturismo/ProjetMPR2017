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
   	[bary_x, bary_y]=find(img_db{im}==1);
    X=round(mean(bary_x));
    Y=round(mean(bary_y));

    label_db{im} = get_label(img_db_list{im});
    clf;imshow(img_db{im});
    
    hold on;
    plot(Y,X,'+r');
    
    getSignature(X, Y, img_db{im});
    
    disp(label_db{im});
    drawnow();
    waitforbuttonpress
end