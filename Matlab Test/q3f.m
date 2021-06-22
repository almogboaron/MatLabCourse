function [cptf, p, av] = q3f (m, v, r)
lm=length(m);
lv=length(v);
lr=length(r);
if ~isempty(m)&&~isempty(v)&&~isempty(r)
    if lm==lv&&lm==lr
        if sum([m>0,v>0,r>0])==sum([lm,lv,lr])
            cptf = (m.*(v.^2))./r;
            p = (r.*2*pi)./v;
            av = v./r ;
        else
            error('m contains at least one non-positive values');
        end
    else
        error('The size of input arguments is incompatible');
    end
else
    error('illegal input')
end
end

        



