function recall = recall_precision(label_db, listLabel)

    cpt = 0;
    im = 1;

    recall = zeros(1, 19);
    X=size(listLabel, 1);
    
    while ( (cpt < 19) && (im <= size(listLabel, 1)) )
        if (strcmp(label_db, listLabel{im}))
            cpt = cpt +1;
            recall(1, cpt) = (double(cpt) / double(im))*100.0;
        end
        im = im +1;
    end

end