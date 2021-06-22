clear all;
clear all classes;
clear all globals;
close all;
pack;
clc;


h   = Hospital;
pt1 = Patient('Keith','Emerson','Radiology','AD');
pt2 = Patient('Greg' ,'Lake'   ,'Radiology','MS');
pt3 = Patient('Carl' ,'Palmer' ,pt2);
pt4 = Patient('Cbrk' ,'Palmer' ,pt2); % change two letters in the name to achieve the same uid
pt5 = Patient('Ccrj' ,'Palmer' ,pt2); % change two letters in the name to achieve the same uid
pt6 = Patient('Cdri' ,'Palmer' ,pt2); % change two letters in the name to achieve the same uid
pt7 = Patient('Cerh' ,'Palmer' ,pt2); % change two letters in the name to achieve the same uid

h = admit_patient(h,pt1);
h = admit_patient(h,pt2);
h = admit_patient(h,pt3);
h = admit_patient(h,pt4);
h = admit_patient(h,pt5);
h = admit_patient(h,pt6);
h = admit_patient(h,pt7);
disp(h);

phys1 = Physician('Vashti','Bunyan','Internal Medicine','Cardiology');
h = add_physician(h,phys1);

% Test removing patient from a cell containing only one patient
[h,pt] = release_patient(h,'Greg' ,'Lake'  );

% Test removing patient from a cell containing a list of patients
[h,pt] = release_patient(h,'Cerh' ,'Palmer'); % remove last on list
[h,pt] = release_patient(h,'Ccrj' ,'Palmer'); % remove from middle of list
[h,pt] = release_patient(h,'Carl' ,'Palmer'); % remove first on list

disp(h);

% Test examining a patient
test_results = [5.0, 3.0, 9.1; ...
                1.1, 3.7, 7.0; ...
                4.5, 4.4, 6.0; ...
				0.1, 0.0, 2.0];
			
pt.set_test_results(test_results);
disp(pt);
fprintf('Patient %s sickness status = %d [1=sick, 0=healthy, -1=unknown]\n',[pt.first_name ' ' pt.last_name], is_sick(pt));
fprintf('Examining patient ...\n');
examine_patient(pt,phys1);
fprintf('Patient %s sickness status = %d [1=sick, 0=healthy, -1=unknown]\n',[pt.first_name ' ' pt.last_name], is_sick(pt));

return;
