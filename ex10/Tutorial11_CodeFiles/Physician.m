
classdef Physician < handle & Employee

properties (Access = public)
% 	first_name; % inherited
% 	last_name;  % inherited
% 	uid;        % inherited
% 	dept;       % inherited
	specialty;
    patient_list;
    salary;
end


  % ==========================
	methods (Access = public)
  % ==========================
	function ph = Physician(first_name,last_name,dept,specialty)
		ph@Employee(first_name,last_name,dept);
		ph.specialty = specialty;
        ph.patient_list = {};
        ph.salary = 1500;
    end
    
    function add_patient_to_physician_list(ph,pt)
        ph.patient_list = [ph.patient_list,{pt}];
    end
    
    function remove_patient_from_physician_list(ph,pt)
        for k = 1:numel(ph.patient_list)
            if ph.patient_list{k} == pt
                ph.patient_list{k} = [];
                break
            end
        end
    end
end% public methods
end
