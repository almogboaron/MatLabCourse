%#ok<*MANU>

classdef my_sphere < shape

properties (SetAccess = public)
	r;
end

properties (Constant)
	dim = 3;
end

% -------------------------------------------------------
% Public methods
% -------------------------------------------------------
methods (Access = public)

	function sphr = my_sphere(c,r)
		% We must first invoke the constructor of the mother class
		sphr@shape(c);
		if nargin == 2
			sphr.r = r;
		else
			sphr.r = 0;
		end
	end
	
	function sphr = my_sphere_copy_constructor(input_s)
		sphr = my_sphere(input_s.color,input_s.r);
	end

	%
	% Implementation of Abstract (virtual) methods
	%
	function vol = getVol(sphr)
		vol = (4/3)*pi*((sphr.r)^3);
	end
	
	function area = getArea(r)
		area = 4*pi*((sphr.r)^2);
	end
	
	function perim = getPerimeter(sphr)
		perim = 2*pi*(sphr.r);
	end
	
	function height = getHeight(sphr)
		height = sphr.r*2;
	end
	
	function width = getWidth(sphr)
		width = sphr.r*2;
	end
	
	% Class specific methods
	function setRadius(sphr,r)
		sphr.r = r;
	end;

	function plot(sphr,x0,y0,z0,fh)
		if ~exist('x0','var') || ~exist('y0','var') || ~exist('z0','var')
			x0 = 0;
			y0 = 0;
			z0 = 0;
		end
			
		[x,y,z] = sphere;
		
		if exist('fh','var')
			figure(fh);
		else
			figure;
		end;

		fill3(x*(sphr.r)+x0, y*(sphr.r)+y0, z*(sphr.r)+z0,sphr.color);
		axis equal;
	end;
	
end % public methods
end % class definition



