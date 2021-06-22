classdef testforclass
    properties
        one;
        two;
        three;
    end
    methods
    end
end
function uid = getuid(f,l)
uid = mod(sum(double([f,