function n = find0(dll)
    d = dlnode_head(dll);
    n=1 ;
    while ~isempty(d)
        if d.Data == 0
            break
        end
        n=n+1;
        d= d.nextnode;
    end
    if isempty(d)
        n=[];
    end 
end
    
    
        

