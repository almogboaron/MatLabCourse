function reverse_stack(A)
NewS = CStack({});
NewSS = CStack({});
while ~A.isempty
    NewS.push(A.top);
    A.pop;
end

while ~NewS.isempty
    NewSS.push(NewS.top);
    NewS.pop;
end

while ~NewSS.isempty
    A.push(NewSS.top);
   NewSS.pop;    
end
end
