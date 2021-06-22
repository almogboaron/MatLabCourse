classdef celestial_body < handle
    
    properties (Access = public)
        name;
    end
    
    properties (Access = protected)
        initial_location;
    end
    methods
        function obj = celestial_body(name,initial_location)
            obj.name =name ;
            obj.initial_location = initial_location;
        end
    end
    methods (Abstract)
        location = get_location(obj,t)
    end
end
            