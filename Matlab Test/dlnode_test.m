
clc;

%Create a node by passing the node's data to the dlnode class constructor. For example, these statements create three nodes with data values 1, 2, and 3:
n1 = dlnode(1);
n2 = dlnode(2);
n3 = dlnode(3);

% Build these nodes into a doubly linked list using the class methods designed for this purpose:
n2.insertAfter(n1) % Insert n2 after n1
n3.insertAfter(n2) % Insert n3 after n2
%%
% Now the three nodes are linked:

n1.Next			% Points to n2
n2.Next.Prev	% Points back to n2
n1.Next.Next	% Points to n3
n3.Prev.Prev	% Points to n1

% Print
clc;
head_nd = dlnode_head(n3);
disp_dlnode_list(head_nd);


% Removing a Node from a List
% Suppose that you create a list with 10 nodes and save the handle to the head of the list:
clcl;
clc;
head = dlnode(1);
for i = 10:-1:2
   new = dlnode(i);
   insertAfter(new,head);
end

head_nd = dlnode_head(head);
disp_dlnode_list(head_nd);

% Now remove the third node (Data property assigned the value 3):
removeNode(head.Next.Next)

p1 = head.Next;
removeNode(p1);

% Now the second node in the list has a data value of 4:
head.Next.Next
% And the previous node has a Data value of 2:
head.Next

head_nd = dlnode_head(head);
disp_dlnode_list(head_nd);


