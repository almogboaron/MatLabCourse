h = Hospital;
pt(1) = Patient('Keith','Emerson','OR','Cardiology');
pt(2) = Patient('Greg' ,'Lake' ,'Radiology','MS');
pt(3) = Patient('Carl' ,'Palmer' ,pt(2));
ph(1) = Physician('Jo','Blake','OR','Cardiology');
ph(2) = Physician('Jo','Blage','OR','Cardiology');
for i=1:length(pt)
admit_patient(h,pt(i));
end
for i=1:length(ph)
add_physician(h,ph(i));
end
h.disp_hospital_balance()
allocate_physician_to_patient(h,'Keith','Emerson','Jo','Blake');
ph(1).patient_list{1}
[pt] = release_patient(h,'Keith','Emerson');
ph(1).patient_list{1}
h.disp_hospital_balance()