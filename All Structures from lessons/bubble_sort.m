function bubble_sort(dll)
    nswaps = 1;
    node = dll;
    while nswaps ~= 0
        nswaps = 0;
        while ~isempty(node.Next)
            if rem(node.Data,2)==1 && rem(node.Next.Data,2)==0
                swap_node_with_next(node);
                nswaps = nswaps+1;
            elseif (node.Data > node.Next.Data) && (rem(node.Data,2) == rem(node.Next.Data,2))
                swap_node_with_next(node);
                nswaps = nswaps + 1;
            else
                node = node.Next;
            end        
        end    
        node = node.dlnode_head;
        disp_dlnode_list(node);
    end
end

% swap node with next
function swap_node_with_next(node)
    node_curr = node;
    node_next = node.Next;
    node_curr.insertAfter(node_next);
end