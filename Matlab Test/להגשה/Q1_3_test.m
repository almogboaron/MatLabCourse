h   = Hospital;
for idx = 1:101
	f  = char((round(randi(25,1,7)+97)));
	l  = char((round(randi(25,1,7)+97)));
	pt = Patient(f,l,'Fundepartment','Codeing');
    gu = Guest(f,l,pt);
	admit_patient(h,pt);
    add_guest_during_covid19(h,gu);
end
clear all 
clc
h   = Hospital;
pt1 = Patient('Almog','Boaron','Mental health','Crazy');
guest1 = Guest('a','b',pt1);
guest2 = Guest('b','c',pt1);
add_guest_during_covid19(h,guest1);
add_guest_during_covid19(h,guest2);

