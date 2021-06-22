%couldnt test all because of errors 
try
m=[2,4];v=[2,4];r=[1 1 1];q3f(m,v,r)
q3f(m,v,r)
catch ME
    disp(ME.message)
end
try
m=[-2,4];v=[2,4];r=[1,1];
q3f(m,v,r)
catch Me
    disp(Me.message)
end
try     
m=[];v=[2,4];r=[1 1];
q3f(m,v,r)
catch Me
    disp(Me.message)
end
