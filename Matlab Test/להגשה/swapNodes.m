function swapNodes(node)
if ~isempty(node.Next)
    next=node.Next;
    removeNode(node);
    node.insertAfter(next);
else
    head=dlnode_head(node);
    removeNode(node);
    node.insertBefore(head);
end
end
