
classdef shape < handle

properties (SetAccess = public)
	color; % [R,G,B]
end

properties (SetAccess = protected)
	uid; % unique identifier
end

properties (Abstract, Constant)
	dim; % dimensionality
end


% -------------------------------------------------------
% Public methods
% -------------------------------------------------------
	function shp = shape(input_param)
		% parse input parameters
		if nargin == 0
			shp.color = [0,0,0];
		elseif isvector(input_param) && (length(input_param) == 3)
			shp.color = input_param;
methods (Access = public)

		elseif isa(input_param,'shape')
			% copy constructor
			shp.color = input_param.color;
		else
			error('Illegal input');
		end
		
		% set unique id to be current time stamp
		shp.uid = now;
		% s.dim = 0;
	end

	function set_color(shp,c)
		if (nargin == 2) && isvector(c) && (length(c) == 3)
			shp.color = c;
		else
			error('Illegal input');
		end
	end
end


% -------------------------------------------------------
% Abstract (virtual) methods
% -------------------------------------------------------
methods (Abstract)
	vol    = getVol      (shp);
	area   = getArea     (shp);
	perim  = getPerimeter(shp);
	height = getHeight   (shp);
	width  = getWidth    (shp);
end
	
end


