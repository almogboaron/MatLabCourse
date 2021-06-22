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

admit_patient(h,pt1);
admit_patient(h,pt2);
admit_patient(h,pt3);
admit_patient(h,pt4);
admit_patient(h,pt5);
admit_patient(h,pt6);
admit_patient(h,pt7);
disp(h);

phys1 = Physician('Vashti','Bunyan','Internal Medicine','Cardiology');
add_physician(h,phys1);

% Test removing patient from a cell containing only one patient
pt = release_patient(h,'Greg' ,'Lake'  );

% Test removing patient from a cell containing a list of patients
pt = release_patient(h,'Cerh' ,'Palmer'); % remove last on list
pt = release_patient(h,'Ccrj' ,'Palmer'); % remove from middle of list
pt = release_patient(h,'Carl' ,'Palmer'); % remove first on list

disp(h);


% --------------------
% Examining a patient
% --------------------
%               val,  norm-low, norm-high
test_results = [5.0,  3.0     , 9.1;     ...
                1.1,  3.7     , 7.0;     ...
                4.5,  4.4     , 6.0;     ...
				0.1,  0.0     , 2.0];
			
pt.set_test_results(test_results);
disp(pt);
fprintf('Patient %s sickness status = %d [1=sick, 0=healthy, -1=unknown]\n',[pt.first_name ' ' pt.last_name], is_sick(pt));
fprintf('Examining patient ...\n');
examine_patient(pt,phys1);
fprintf('Patient %s sickness status = %d [1=sick, 0=healthy, -1=unknown]\n',[pt.first_name ' ' pt.last_name], is_sick(pt));


% ---------------------
% Hash test 2020_06_21
% ---------------------
clc;
for idx = 1:1000
	f  = char((round(randi(25,1,7)+97)));
	l  = char((round(randi(25,1,6)+97)));
	pt = Patient(f,l,'Radiology','AD');
	admit_patient(h,pt);
end
[hash_sparsity,avg_cell_capacity] = check_patient_list_sparsity(h);
fprintf(' hash_sparsity = %1.1f \n avg_cell_capacity = %1.2f\n',hash_sparsity,avg_cell_capacity)


return;
