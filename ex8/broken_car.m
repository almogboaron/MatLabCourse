classdef broken_car < car
    
    properties( Access = public )
        faults;
        prices;
        status;
    end
    methods
        function obj = broken_car(c, faults)
            obj@car(c.number,c.owner)
            [Faults,Pricelist] = load_pricelist(c);
            index = [];
            for i = 1:length(faults)
                str = faults{i};
                if isempty(index)
                    index = find(contains(Faults,str));
                else
                index = [index,find(contains(Faults,str))] ; 
                end
            end
            obj.status = 'pending' ; 
            obj.faults = faults;
            obj.prices = Pricelist(index);
        end
        function fcar = fix(obj)
            if obj.status == 'handled'
                fcar = [];
                warning('The car has already been fixed');
            else    
                fcar = fixed_car(obj);
                obj.status = 'handled';
            end
        end
    end
end
