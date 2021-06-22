function n = count_zeros(d)
    head = dlnode_head(d);
    n = 0;
    while ~isempty(head)
        data = head.Data;
        n = n + sum(data == 0);
        head = head.Next ; 
    end
end
    
    