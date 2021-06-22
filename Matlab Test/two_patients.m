test_results = [5.0, 3.0 , 9.1; ...
1.1, 3.7 , 7.0; ...
4.5, 4.4 , 6.0; ...
0.1, 0.0 , 2.0];
pt2 = Patient('Greg','Lake','Radiology','MS');
phys1 = Physician('Vashti','Bunyan','Internal Medicine','Cardiology');
new_pt = Patient('Greg','Lake',pt2);
h = Hospital;
admit_patient(h,pt2);
pt2.set_test_results(test_results);
examine_patient(pt2,phys1);
is_new_pt_sick = is_sick(new_pt);