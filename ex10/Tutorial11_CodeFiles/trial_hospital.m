
% Hospital
h = Hospital;

% Person (super-class)
Per1 = Person('Mr', 'Li');

% Employe (sub-class)
Emp1 = Employee('Bob', 'Marley', 'dep1');
disp(Emp1.get_name);
Emp1.set_uid(123);

% Physician (sub-sub-class)
Ph1 = Physician('Dr', 'Zhivago', 'Pulmonary', 'Viral');
Ph2 = Physician('Dr', 'No', 'Radiology', 'MRI');
Ph3 = Physician('Professor', 'El', 'Neurosurgery', 'Tumors');

% Patient (sub-class)
% option 1 - Pat1 = Patient(first_name, last_name, Pat0); (3)         % === copy constructor ===
% option 2 - Pat1 = Patient(first_name, last_name, dept, disease); (4)
% option 3 - Pat1 = Patient(first_name, last_name, dept, disease, bill, phisician, hospital, test_results, sick_flag); (9)
Pat0 = Patient('Xie', 'Huang', 'Pulmonary', 'Corona');
Pat1 = Patient('Xhf', 'Huang', 'Pulmonary', 'Corona');
Pat2 = Patient('Wu Tang', 'Clan', Pat0);
Pat3 = Patient('Mr', 'Lovalova', 'Orthopedic', 'Knee pain');
Pat4 = Patient('Gore', 'Belly', 'Gastro', 'Ulcer');

% Guest 1 (sub-class)
G1 = Guest('Mother', 'Teresa', Pat0);
G1.set_uid(999);
disp(G1.date_visited);
disp(G1.patient_visited);
        
% Test examining a patient
test_results = [5.0, 3.0, 9.1; ...
                1.1, 3.7, 7.0; ...
                4.5, 4.4, 6.0; ...
                0.1, 0.0, 2.0];
  
% add patients to hospital            
h.admit_patient(Pat0);
h.admit_patient(Pat1);
h.admit_patient(Pat2);
h.admit_patient(Pat3);

% add physicians to hospital
h.add_physician(Ph1);
h.add_physician(Ph2);
h.add_physician(Ph3);

% examine patient
Pat1.set_test_results(test_results);
Pat1.examine_patient(Ph1); % set sick_flag and associate patient with physician
Pat4.examine_patient(Ph1); % patient must be admitted and have test results to be examined

% Remove patients
% pt = h.release_patient('Xie' ,'Huang');   % remove patient
% pt = h.release_patient('Carl' ,'Palmer'); % does not exist - ERROR

% sneeze
Pat3 = Pat1.sneeze(Per1);
    
% find person
Person1 = h.find_person('Xie', 'Huang', 'Patient');
Person2 = h.find_person('Xhf', 'Huang', 'Patient'); 
Person4 = h.find_person('Xgg', 'Huang', 'Patient'); 
Person3 = h.find_person('Dr', 'No', 'Physician');     
