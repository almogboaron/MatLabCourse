function insert_to_list(d, n)
    head = dlnode_head(d);
    newnode = dlnode(n);
    while ~isempty(head)
        if  head.Data >= n
                newnode.insertBefore(head);
                break
        end
        if ~isempty(head.Next)
            if head.Data <= n && head.Next.Data >= n
                newnode.insertAfter(head);
                break
            end
        else
            if head.Data <= n
                newnode.insertAfter(head);
                break
            end
        end
        head = head.Next();
    end
end
 
        
            