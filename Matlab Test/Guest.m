
classdef Guest < handle & Person

properties (Access = public)
% 	first_name; % inherited
% 	last_name;  % inherited
% 	uid;        % inherited
	date_visited;
	patient_visited;
end

  % ==========================
	methods (Access = public)
  % ==========================
	function gst = Guest(first_name,last_name,pt)
		gst@Person(first_name,last_name);

		gst.date_visited    = date;
		gst.patient_visited = [pt.first_name ' ' pt.last_name];
	end
	
	end	% public methods
end


