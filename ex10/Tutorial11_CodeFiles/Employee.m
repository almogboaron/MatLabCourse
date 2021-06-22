
classdef Employee < handle & Person

properties (Access = public)
% 	first_name; % inherited
% 	last_name;  % inherited
% 	uid;        % inherited
	dept;
end

  % ==========================
	methods (Access = public)
  % ==========================
	function em = Employee(first_name,last_name,dpt)
		em@Person(first_name,last_name);
		em.dept = dpt;
	end
	
	end	% public methods
end


