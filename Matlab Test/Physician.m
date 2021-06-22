
classdef Physician < handle & Employee

properties (Access = public)
% 	first_name; % inherited
% 	last_name;  % inherited
% 	uid;        % inherited
% 	dept;       % inherited
	specialty;
end


  % ==========================
	methods (Access = public)
  % ==========================
	function ph = Physician(first_name,last_name,dept,specialty)
		ph@Employee(first_name,last_name,dept);
		ph.specialty = specialty;
	end

	end % public methods
end

