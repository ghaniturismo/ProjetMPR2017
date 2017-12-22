function recall = recall_precision(reqLabel, listLabel)

cpt = 0;
i = 1;

recall = zeros(1, 19);

while ( (cpt < 19) && (i <= size(listLabel, 2)) )
    if (strcmp(reqLabel, listLabel{i}))
        cpt = cpt +1;
        recall(1, cpt) = (double(cpt) / double(i))*100.0;
    end
    i = i +1;
end


end