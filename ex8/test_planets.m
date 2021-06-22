sun = star('sun',[0,0]);
sun_loc = sun.get_location(1);
earth = planet('earth',[1,0],sun,4);
earth_loc = earth.get_location(1);
moon = planet('moon',[0.8,0],earth,1);
moon_loc = moon.get_location(0.5);
t = linspace(0,20,100);
for k = 1:length(t)
sun_loc = sun.get_location(t(k));
earth_loc = earth.get_location(t(k));
moon_loc = moon.get_location(t(k));
h =plot(sun_loc(1),sun_loc(2),'ob',earth_loc(1),earth_loc(2),'or',moon_loc(1),moon_loc(2),'og');
xlim([-2,2]);
ylim([-2,2]);
refreshdata(h,'caller')
drawnow;
pause(0.5);
end