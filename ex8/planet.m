classdef planet < celestial_body
    properties
        star;
        period_time;
    end
    methods
        function obj = planet(name ,ini, star,period_time)
            obj@celestial_body(name,ini);
            obj.star=star;
            obj.period_time = period_time;
        end
        function cur_location = get_location(planet_obj,t)
            theta = (t/planet_obj.period_time)*2*3.14159;
            planet_to_sun = (planet_obj.initial_location-planet_obj.star.initial_location);
            size_of_radios = sqrt(sum(planet_to_sun.*planet_to_sun));
            initialtehta = atan2(planet_to_sun(2),planet_to_sun(1));
            cur_location = size_of_radios*[cos(theta + initialtehta),sin(theta + initialtehta)]+get_location(planet_obj.star,t);
        end
    end
end