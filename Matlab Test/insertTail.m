function insertTail(data, arbitrary_node)
while ~isempty(arbitrary_node.Next)
    arbitrary_node = arbitrary_node.Next;
end
TailNode = dlnode(data);
TailNode.insertAfter(arbitrary_node)
end


