
classdef Patient < handle & Person

properties (Access = public)
% 	first_name;     % inherited
% 	last_name;      % inherited
% 	uid;            % inherited
	dept;			% string
	disease;		% string
	bill;			% double
	physician;		% class pointer
	hospital;       % class pointer
	test_results;	% 2D matrix; Rows = tests; Columns = [current value, norm-low, norm-high] 
	sick_flag;		% double [-1=unknown; 0=healthy; 1=sick]
end

properties (Constant)
	PATIENT_STATUS_UNKNOWN = -1;
	PATIENT_STATUS_HEALTHY =  0;
	PATIENT_STATUS_SICK    =  1;
end

  % ===========================
	methods (Access = public)
  % ===========================
		
	function pt = Patient(varargin)
		pt@Person(varargin{1},varargin{2});
% 		p.uid        = 0; % set only when admitting into hospital
		pt.sick_flag = pt.PATIENT_STATUS_UNKNOWN; % patient sickness status is unknown until examined
		
		switch nargin
		case 3 % Copy constructor
			input_patient   = varargin{3};
			pt.dept         = input_patient.dept;
			pt.disease      = input_patient.disease;
			pt.bill         = input_patient.bill;
			pt.physician    = input_patient.physician;
			pt.hospital     = input_patient.hospital;
			pt.test_results = input_patient.test_results;
			pt.sick_flag    = input_patient.sick_flag;
		case 4
			pt.dept         = varargin{3};
			pt.disease      = varargin{4};
		case 9
			pt.dept         = varargin{3};
			pt.disease      = varargin{4};
			pt.bill         = varargin{5};
			pt.physician    = varargin{6};
			pt.hospital     = varargin{7};
			pt.test_results = varargin{8};
			pt.sick_flag    = varargin{9};
		otherwise
			error('Illegal input arguments');
		end
	end
	
	function set_test_results(pt,test_res)
		pt.test_results = test_res;
	end

	function sick_flag = is_sick(pt)
		sick_flag = pt.sick_flag;
	end
	
	function examine_patient(pt,ph)
		if isempty(pt.test_results)
			warning('Cannot examine patient without valid test results');
			return;
		end;
		
		pt.physician = ph;
		pt.sick_flag = pt.PATIENT_STATUS_HEALTHY;   % assume healthy unless proven otherwise
		
		for test_idx = 1:size(pt.test_results,1)
			if (pt.test_results(test_idx,1) < pt.test_results(test_idx,2)) || ...
			   (pt.test_results(test_idx,1) > pt.test_results(test_idx,3))
				pt.sick_flag = pt.PATIENT_STATUS_SICK; 
			end
			pt.bill = pt.bill + pt.hospital.examination_fee; % we can break here
		end
    end
    
    function pt2 = sneeze(pt, pers2) % Q4
        pt2 = pers2;
        if pt.is_sick == pt.PATIENT_STATUS_SICK
            n = rand(1);
            if n < 0.3 % chance of infecting
                pt2 = Patient(pers2.first_name, pers2.last_name, pt.dept, pt.disease);
                pt2.sick_flag = pt2.PATIENT_STATUS_SICK;
                disp([pers2.first_name ' ' pers2.last_name ' was infected']);
                return;
            end
        end
        disp([pers2.first_name ' ' pers2.last_name ' was not infected']);
    end
	
	end % public methods
end


