head= dlnode(1);
for i = [3,9,6,10,27,50,13,20,16]
    node = dlnode(i);
    node.insertAfter(head)
    head = node;
end
head=dlnode_head(head);
for i = [6,1,16]
    head = deleteNode(head,i);
end
disp_dlnode_list(head);