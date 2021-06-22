function result = is_complementary_strand(head_strand_1_dll,head_strand_2_dll)
mainnode = head_strand_1_dll;   
subnode = head_strand_2_dll;
result1 = 1;
result2 = 1;
while ~isempty(mainnode)
    if ~(get_complementary_nuc(mainnode.Data) == subnode.Data)
        result1 = 0;
    end
    mainnode = mainnode.Next;
    if ~isempty(mainnode)
        subnode = subnode.Next;
    end
end 
mainnode = head_strand_1_dll;
while ~isempty(mainnode)
    if ~(get_complementary_nuc(mainnode.Data) == subnode.Data)
        result2 = 0;
    end
    mainnode = mainnode.Next;
    if ~isempty(mainnode)
        subnode = subnode.Prev;
    end
    
end
result = max(result1,result2);
    