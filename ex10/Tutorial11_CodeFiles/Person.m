
classdef Person < handle
	properties (Access = public)
		first_name;
		last_name;
		uid;
	end

	methods (Access = public)

	function p = Person(first_name,last_name)
		if (nargin ~= 2) || ~ischar(first_name) || ~ischar(last_name)
			error('Illegal input puarameter');
		end;
		p.first_name = first_name;
		p.last_name  = last_name;
% 		p.uid        = uid;
	end

	function [f,l] = get_name(pt)
		f = pt.first_name;
		l = pt.last_name;
	end

	function set_uid(pt,uid)
		pt.uid = uid;
	end
	
	function uid = get_uid(pt)
		uid = pt.uid;
	end

	end % public methods
end