
%% admition
manual_data = readtable('manual_registration.xlsx')
shiba = Hospital ();

for i=1:size(manual_data,1)
    if strcmp(manual_data.type_of_person{i},'Patient')
        pt = Patient(manual_data.first_name{i},manual_data.last_name{i},manual_data.department{i},manual_data.disease_or_speciality{i});
        admit_patient(shiba,pt);
    elseif strcmp(manual_data.type_of_person{i},'Physician')
        ph = Physician(manual_data.first_name{i},manual_data.last_name{i},manual_data.department{i},manual_data.disease_or_speciality{i});
        add_physician(shiba,ph);
    else
        warning('person type must be Patient or Physician')
    end
end
%% allocate physician

%allocate Gal Toren to Dana Levi

ph = find_person(shiba,'Gal','Toren','Physician');
pt = find_person(shiba,'Dana','Levi','Patient');
pt.physician
pt.physician = ph;

pt2 = find_person(shiba,'Dana','Levi','Patient');
pt2.physician
