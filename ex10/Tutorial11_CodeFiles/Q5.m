
% =================== Q5 ===================

% ------ Section A ------

h   = Hospital;
pt(1) = Patient('Keith','Emerson','Radiology','AD');
pt(2) = Patient('Greg' ,'Lake'   ,'Radiology','MS');
pt(3) = Patient('Carl' ,'Palmer' ,pt(2));
pt(4) = Patient('George' ,'Palmer' ,pt(2)); 
pt(5) = Patient('Nick' ,'Stone' ,pt(1));
pt(6) = Patient('Laura' ,'Palmer' ,pt(1));
pt(7) = Patient('James','Bloom','Oncology','Lung Cancer');
pt(8) = Patient('Darla' ,'Grey','Oncology','Lung Cancer');

for i=1:length(pt)
	admit_patient(h,pt(i));
end

disp(h);

% ------ Section B ------

disease_hash = get_patient_count_per_disease(h);

% ------ Section C ------

h.plot_count_bar(disease_hash, 'Diseases');
