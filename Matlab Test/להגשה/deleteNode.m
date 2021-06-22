function [dll_head] = deleteNode(head, x)
while ~isempty(head.Next)
    if head.Data == x
        dll_head = head.Next;
        removeNode(head);
        dll_head = dlnode_head(dll_head);
        return
    else
        head = head.Next;
    end
end
if head.Data == x
    dll_head = head.Prev;
    removeNode(head);
    dll_head = dlnode_head(dll_head);
    return
end
end

