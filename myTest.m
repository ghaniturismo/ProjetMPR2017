% recall et precision sont des matrices  de tailles identiques num_ref X 19 
% où num_ref est le nombre d'objets de référence (le nombre d'images requêtes) 
% et 19 est le nombre d'images à retrouver pour chaque requête

function [recall, precision] = tests()
img_db_path = './db/';
img_db_list = glob([img_db_path, '*.gif']);

img_db = cell(1);
label_db = cell(1);
fd_db = cell(1);

%parametre
teta = pi/32;
CoeffsAGarder = floor((2.0*pi/teta) * 0.75);
pasTeta = 0:teta:2*pi;

rDescrDB  = cell(1);

for im = 1:numel(img_db_list)
    img_db{im} = logical(imread(img_db_list{im}));
    label_db{im} = get_label(img_db_list{im});
    clf;

    [Y,X] = barycentre(img_db{im});
    %On recupere r le vecteur de Distance Au Baricentre
    [rdb,pCY,pCX]=vecteur_DistanceAuBaricentre(X, Y, img_db{im},teta);
    
    rDescrDB{im}=descripteur(rdb,CoeffsAGarder);
      %waitforbuttonpress
end
%**************************************************************************

img_dbq_path = './dbq/';
img_dbq_list = glob([img_dbq_path, '*.gif']);

recall_Moyen = zeros(1, 19);
for im = 1:numel(img_dbq_list)
        
    img_dbq = logical(imread(img_dbq_list{im}));
    label_dbq = get_label(img_dbq_list{im});
    distEuc=cell(1);
    disp(label_dbq);

    [Y,X] = barycentre(img_dbq);
    
    [rdbq,pCY,pCX]=vecteur_DistanceAuBaricentre(X, Y, img_dbq,teta);
       
    rDescrDBQ=descripteur(rdbq,CoeffsAGarder);
    
    %recal precision
    
   %parcours des images db
   for i = 1:numel(img_db_list)
       %calcul descripteur images db
       distEuc{i} = norm(rDescrDB{i}-rDescrDBQ);
   end
   
    data = [label_db; img_db; distEuc];
    data=transpose(data);
    data = sortrows(data, 3);
        
    recall = recall_precision(label_dbq, label_db);
    recall_Moyen = recall_Moyen + recall;
    
    
    subplot(3, 5, 1);
    imshow(img_dbq);
    title('Image requête');
    
    subplot(3, 5, 2);
    plot(recall);
    
        for i = 6 : 10 
            subplot(3, 5, i);
            imshow(data{i-5, 2});
            title(data{i-5,1});
        end
    
    
    subplot(3, 5, 11:15 );
    plot(recall_Moyen / im);
    title('recall moyen');
    xlabel('ième image trouvée en moyenne');
    
    %plot(rDescrDBQ{im});
    %title('Descripteur DBQ');
    drawnow();
    waitforbuttonpress
end


end