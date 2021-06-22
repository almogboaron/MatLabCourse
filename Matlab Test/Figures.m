figure(1)
hold on
m1=4;v1=0.01:0.01:3;r1=1;
plot1=[];
for i=v1
    plot1 =[plot1 q3f(m1,i,r1)];
end
plot(v1,plot1,'r--')
title('cptf versus velocity');
xlabel('velocity');
ylabel('cptf');

hold off
figure (2)
hold on 
m2=1:0.5:20;v2=3;r2=1;
plot2=[];
for i2=m2
    plot2 = [plot2 q3f(i2,v2,r2)];
end
plot(m2,plot2,'r--')
title('cptf versus mass')
xlabel('Mass')
ylabel('cptf')
hold off
figure (3)
hold on
m3=4;v3=3;r3=0.1:0.1:10;
plot3=[];
for i3=r3
    plot3 = [plot3 q3f(m3,v3,i3)];
end
plot(r3,plot3,'r--')
title('cptf versus radius')
xlabel ('Radios')
ylabel('cptf')
hold off


