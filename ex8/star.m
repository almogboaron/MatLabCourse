classdef star < celestial_body
   methods
       function obj = star(a,b)
           obj@celestial_body(a,b)
       end
       function cur_location = get_location(star_obj,t)
           cur_location =  star_obj.initial_location;
       end
   end
end

           