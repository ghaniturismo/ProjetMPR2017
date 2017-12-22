% recall et precision sont des matrices  de tailles identiques num_ref X 19 
% où num_ref est le nombre d'objets de référence (le nombre d'images requêtes) 
% et 19 est le nombre d'images à retrouver pour chaque requête

function [recall, precision] = tests()
    %data Base 
    img_db_path = './db/';
    img_db_list = glob([img_db_path, '*.gif']);

    %data Base Query
    img_dbq_path = './dbq/';
    img_dbq_list = glob([img_dbq_path, '*.gif']);

    %size Image of folder db and dbq 
    sizeImgDB=numel(img_db_list);
    sizeImgDBQ=numel(img_dbq_list);

    img_db = cell(1);
    label_db = cell(1);

    %parametre
    teta = pi/128;
    CoeffsAGarder = floor((2.0*pi/teta) * 0.75);
    
    %inititalisation du descripteur db
    rDescrDB  = cell(1);
    
    %Parcourt de la liste des images de db
    for im = 1:sizeImgDB
        img_db{im} = logical(imread(img_db_list{im}));
        label_db{im} = get_label(img_db_list{im});
        disp(label_db{im});
        
        %Recuperation du barycentre de l'image
        [Y,X] = barycentre(img_db{im});
        
        %Recuperation du vecteur de Distance Au Baricentre rdb
        [rdb,pCY,pCX]=vecteur_DistanceAuBaricentre(X, Y, img_db{im},teta);
        
        %Recuperation du vecteur descripteur du vecteur rdb
        rDescrDB{im}=descripteur(rdb,CoeffsAGarder);

    end

    %Inititalisation du recall
    recall = zeros(1, 19);
    
    %Parcourt de la liste des images de dbq
    for im = 1:sizeImgDBQ
        img_dbq = logical(imread(img_dbq_list{im}));
        label_dbq = get_label(img_dbq_list{im});
        clf;
        
        %Inititalisation de la distance euclidienne du descripteur db et du
        %descripteur dbq
        distEuc=cell(1);
        
        disp(label_dbq);
        %Inititalisation de la precision
        precision = zeros(1, 19);

        %Recuperation du barycentre de l'image
        [Y,X] = barycentre(img_dbq);

        %Recuperation du vecteur de Distance Au Baricentre rdbq
        [rdbq,pCY,pCX]=vecteur_DistanceAuBaricentre(X, Y, img_dbq,teta);

        %Recuperation du vecteur descripteur du vecteur rdbq   
        rDescrDBQ=descripteur(rdbq,CoeffsAGarder);

        % Calcul de la distance euclidienne du descripteur db
        % et descripteur dbq
        for i = 1:sizeImgDB
            distEuc{i} = norm(rDescrDB{i}-rDescrDBQ);
        end

        %Tri des distances euclidiennes distEuc par ordre croissant
        vect_tmp = [label_db; img_db; distEuc];
        vect_tmp = transpose(vect_tmp);
        vect_tmp = sortrows(vect_tmp, 3);
        
        %Recuperation du premier vecteur qui correspond au Label des images 
        vect_Labeldb = vect_tmp(:,1);
        
        %recall precession
        precision = recall_precision(label_dbq,vect_Labeldb);
        recall = recall + precision;

        %Affichages 
        subplot(3, 5, 1);
        imshow(img_dbq);
        title('Requete');

        subplot(3, 5, 2);
        imshow(img_dbq); hold on;
        plot(pCY, pCX, '.R');
        plot(Y,X, '+G');
        title('Signature');
        
        subplot(3, 5, 3:5);
        plot(precision);
        title('Precision');
        
        for i = 6 : 10 
            subplot(3, 5, i);
            imshow(vect_tmp{i-5, 2});
            title(vect_tmp{i-5,1});
        end

        subplot(3, 5, 11:15 );
        plot(recall / im);
        title('Recall Precision');

        drawnow();
        waitforbuttonpress
    end

end