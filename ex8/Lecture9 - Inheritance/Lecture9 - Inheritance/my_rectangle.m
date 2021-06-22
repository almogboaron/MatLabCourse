%#ok<*MANU>

classdef my_rectangle < shape

properties (SetAccess = public)
	h;
	w;
end

properties (Constant)
	dim = 2;
end

% -------------------------------------------------------
% Public methods
% -------------------------------------------------------
methods (Access = public)

	function rect = my_rectangle(c,w,h)
		% We must first invoke the constructor of the mother class
		rect@shape(c);
		
		% Now, process the input parameters
		if nargin == 3
			rect.w = w;
			rect.h = h;
		else
			rect.w = 0;
			rect.h = 0;
		end
	end

	%
	% Implementation of Abstract (virtual) methods
	%
	function vol = getVol(r)
		warning('Cannot calculate volume for two dimensional shape');
		vol = -1;
	end
	
	function area = getArea(r)
		area = r.w * r.h;
	end
	
	function perim = getPerimeter(r)
		perim = 2*(r.w+r.h);
	end
	
	function height = getHeight(r)
		height = r.h;
	end
	
	function width = getWidth(r)
		width = r.w;
	end
	
	% Class specific methods
	function setWidth_and_Height(r,w,h)
		r.w = w;
		r.h = h;
	end

	function plot(r,a,b,fh)
		if ~exist('a','var') || ~exist('b','var')
			a = 0;
			b = 0;
		end
		
		if exist('fh','var')
			figure(fh);
		else
			figure;
		end;
		
		rectangle('Position', [-r.w/2+a,-r.h/2+a,r.w/2+b,r.h/2+b],'EdgeColor',r.color,'linewidth',4);
		axis equal;
	end;
	
end % public methods
end % class definition


