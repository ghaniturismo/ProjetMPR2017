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

%parametre
teta = pi/2;
CoeffsAGarder = floor((2.0*pi/teta) * 0.75);
pasTeta = 0:teta:2*pi;

rDescrDB  = cell(1);

for im = 1:numel(img_db_list)
    img_db{im} = logical(imread(img_db_list{im}));
    label_db{im} = get_label(img_db_list{im});
    clf;
    %disp(label_db{im}); 
    %drawnow();
    
%subplot(2,3,1);

    %Barycentre
    [Y,X] = barycentre(img_db{im});
    %On recupere r le vecteur de Distance Au Baricentre
    [rdb,pCY,pCX]=vecteur_DistanceAuBaricentre(X, Y, img_db{im},teta);
    
    %plot(pasTeta,r);
    %title('Signature de l image ');

%subplot(2,3,2);

    %imshow(img_db{im}); hold on;
    %plot(pCY, pCX, '.R');
    %plot(Y,X, '+G');
    %title('Affichage image');
    %drawnow();
%subplot(2,3,3);
    rDescrDB{im}=descripteur(rdb,CoeffsAGarder);
    %plot(rDescrDB{im});
    %title('Descripteur');    
    
    %waitforbuttonpress
end
%**************************************************************************
%**************************************************************************
%**************************************************************************

img_dbq_path = './dbq/';
img_dbq_list = glob([img_dbq_path, '*.gif']);
rDescrDBQ = cell(1);

for im = 1:numel(img_dbq_list)
        distEuc=cell(1);
    img_dbq{im} = logical(imread(img_dbq_list{im}));
    label_dbq{im} = get_label(img_dbq_list{im});
    clf;

    [Y,X] = barycentre(img_dbq{im});
    
    [rdbq,pCY,pCX]=vecteur_DistanceAuBaricentre(X, Y, img_dbq{im},teta);
       
    rDescrDBQ{im}=descripteur(rdbq,CoeffsAGarder);
    
    %recal precision
    
    %[resDescr, indiceLabel, nomLabel] = triDistEuclidienne(rDescrDBQ{im}, rDescrDB, label_db);
    
   %parcours des images db
   for i = 1:numel(img_db_list)
       %calcul descripteur images db
       distEuc{i} = norm(rDescrDB{i}-rDescrDBQ);
   end
   
   data = [label_db; im_db; distEuc];
   data=transpose(data);
   data = sortrows(data, 3);
    
    
    
    recall = recall_precision(label_dbq, nomLabel);
    
    %plot(rDescrDBQ{im});
    %title('Descripteur DBQ');
    
    waitforbuttonpress
end


end