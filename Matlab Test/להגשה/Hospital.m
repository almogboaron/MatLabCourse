
classdef Hospital < handle

properties (Access = public)
	max_N;
	admittance_fee;
	examination_fee;
	patient_list;
	physician_list;
	employee_list;
	guest_list;
	N_patients;
	N_physicians;
	N_employees;
	N_guests;
end


  % =============================
	  methods (Access = public)
  % =============================
	
	% -----------------
	% Constructor
	% -----------------
	function h = Hospital()
		h.max_N           = 1000;
		h.admittance_fee  = 100;  % [$]
		h.examination_fee = 10;   % [$]
		h.patient_list    = cell(1,h.max_N);
		h.physician_list  = cell(1,h.max_N);
		h.employee_list   = cell(1,h.max_N);
		h.guest_list      = cell(1,h.max_N);
		h.N_patients      = 0;
		h.N_physicians    = 0;
		h.N_employees     = 0;
		h.N_guests        = 0;
	end

	% --------------------------------
	% Adding items into Hospital class
	% --------------------------------
	% This function admits a patient into the hospital.
	% This is done directly by treating each object according to its type.
	function admit_patient(h,pt)
		uid         = generate_uid(h,pt.first_name,pt.last_name);
		pt.bill     = h.admittance_fee;
		pt.hospital = h;
		if isempty(h.patient_list{uid.cell})
			% If the patient list at location uid.cell is empty, just put the new patient there
			uid.loc = 1;
			pt.uid  = uid;
			h.patient_list{uid.cell}(1) = pt;  % we insert the patient as the first element of an array with length = 1
		else
			% ... otherwise create an array of patients within that cell
			l = length(h.patient_list{uid.cell});
			uid.loc = l+1;
			pt.uid  = uid;
			h.patient_list{uid.cell}(uid.loc) = pt;
		end
		h.N_patients     = h.N_patients + 1;
	end
	
	% The following three functions adds people to the hospital
	% but use a more generic funtion that saves us the time to re-write the same code
	% again and again, by knowing that all people eventually inherent from the class 'Person'
	function add_physician(h,ph)
		add_person_to_list(h,'physician_list',ph);
		h.N_physicians = h.N_physicians + 1;
	end
	
	function add_employee(h,em)
		add_person_to_list(h,'employee_list',em);
		h.N_employees = h.N_employees + 1;
	end
	
	function add_guest(h,gu)
		add_person_to_list(h,'guest_list',gu);
		h.N_guests = h.N_guests + 1;
    end
    function add_guest_during_covid19(h,gu)
        if h.N_guests < 100
            for i = 1:length(h.guest_list)
                for j = 1:length(h.guest_list{i})
                    if gu.patient_visited == h.guest_list{i}(j).patient_visited
                        uiwait(warndlg('Cannot add guest, one guest already submitted'));
                        return
                    end
                end
            end
            add_guest(h,gu)
        else
            uiwait(warndlg('Cannot add guest, reached maximal guest capacity'));
        end
    end
	function get_guest(h,gu)
		
	end

	
	% ----------------------------------
	% Removing items from Hospital class
	% ----------------------------------
	function pt = release_patient(h,first_name,last_name)
		pt = remove_person_from_list(h,'patient_list',first_name,last_name);
		h.N_patients = h.N_patients - 1;
	end
	
	function ph = remove_physician(h,first_name,last_name)
		ph = remove_person_from_list(h,'physician_list',first_name,last_name);
		h.N_physicians = h.N_physicians - 1;
	end

	function em = remove_employee(h,first_name,last_name)
		em = remove_person_from_list(h,'employee_list',first_name,last_name);
		h.N_employees = h.N_employees - 1;
	end
	
	function gu = remove_guest(h,first_name,last_name)
		gu = remove_person_from_list(h,'guest_list',first_name,last_name);
		h.N_guests = h.N_guests - 1;
	end
	
	% --------------------------------
	% Plotting
	% --------------------------------
	function disp(h)
		fprintf('\n\n');
		fprintf('=============================\n');
		fprintf(' Printing hospital personnel \n');
		fprintf('=============================\n');
		if (h.N_patients   == 0),  fprintf('Patient   list is empty\n');  else,  disp_list(h,'patient_list'  );  fprintf('<<< end of patient list  \n'); end;
		if (h.N_physicians == 0),  fprintf('Physician list is empty\n');  else,  disp_list(h,'physician_list');  fprintf('<<< end of Physician list\n'); end;
		if (h.N_employees  == 0),  fprintf('Employee  list is empty\n');  else,  disp_list(h,'employee_list' );  fprintf('<<< end of Employee list \n'); end;
		if (h.N_guests     == 0),  fprintf('Guest     list is empty\n');  else,  disp_list(h,'guest_list'    );  fprintf('<<< end of Guest list    \n'); end;
	end
	
	% 2020_06_21
	function [hash_sparsity,avg_cell_capacity] = check_patient_list_sparsity(h)
		cnt = 0;
		for idx = 1:h.max_N
			if ~isempty(h.patient_list{idx})
				cnt = cnt + 1;
			end
		end
		hash_sparsity     = 100 * (cnt / h.max_N);
		avg_cell_capacity = h.N_patients / cnt;
	end
	
	 end % public methods
	
  % ============================
	 methods (Access = private)
  % ============================
	function uid = generate_uid(h,f,l)
        if sum([h.N_patients,h.N_physicians,h.N_employees,h.N_guests])==0
            uid.cell = mod(sum(double([f l])),sum([h.N_patients,h.N_physicians,...
            h.N_employees,h.N_guests,1]));
        else
            uid.cell = mod(sum(double([f l])),sum([h.N_patients,h.N_physicians,...
            h.N_employees,h.N_guests]));
        end
		
		% In case the sum equals 1000
		if (uid.cell == 0)
			uid.cell = 1;
		end
		uid.loc = 1;
	end
	
	function add_person_to_list(h,list_name,pr)
		uid = generate_uid(h,pr.first_name,pr.last_name);
		
		if isempty(h.(list_name){uid.cell})
			% If the patient list at location uid.cell is empty, just put the new patient there
			uid.loc = 1;
			pr.uid  = uid;
			h.(list_name){uid.cell}(1) = pr;
		else
			% ... otherwise create a list of persons in that loacation
			len = length(h.(list_name){uid.cell});
			uid.loc = len+1;
			pr.uid  = uid;
			h.(list_name){uid.cell}(uid.loc) = pr;
		end
	end

	function pr = remove_person_from_list(h,list_name,first_name,last_name)
		uid = generate_uid(h,first_name,last_name);
		
		if isempty(h.(list_name){uid.cell})
% 			error('Person does not exist in this hospital');    % option 1 - crashes the code in case person is not found
			warning('Person does not exist in this hospital');  % option 2 - does not crash the code
			return;
		else
			len = length(h.(list_name){uid.cell});
			if (len == 1)
				pr = h.(list_name){uid.cell}(1);
				h.(list_name){uid.cell}(1) = [];
			else
				for person_idx = 1:len
					pr = h.(list_name){uid.cell}(person_idx);
					if strcmp(pr.first_name,first_name) && strcmp(pr.last_name,last_name)
						% Found the person we need to remove.
						% First - put the last element in its place
% 						if person_idx ~= len
% 							h.(list_name){uid.cell}(person_idx) = h.(list_name){uid.cell}(end);
% 						end
% 						% Second - Shorten the list length (in a rather inefficient way...)
% 						h.(list_name){uid.cell} = h.(list_name){uid.cell}(1:end-1);

						h.(list_name){uid.cell}(person_idx) = [];
						% No need to continue going over the list of people. break out of the forloop
						break;
					end
				end % forloop
			end % if (len == 1)
		end % if (isempty)
	end % function
	
	function disp_list(h,list_name)
		fprintf('-----------------------\n');
		fprintf('%s                     \n',list_name);
		fprintf('-----------------------\n');
		counter = 0;
		for cell_idx = 1:h.max_N
			if (~isempty(h.(list_name){cell_idx}))
				for lst_idx = 1:length(h.(list_name){cell_idx})
					counter = counter +1;
					obj = h.(list_name){cell_idx}(lst_idx);
					fprintf('%1.0f: %s %s\n',counter,obj.first_name, obj.last_name)
				end
			end
		end		
		fprintf('Total number = %1.0f   \n',counter);
		fprintf('                       \n');
	end
	
	end % private methods

end


