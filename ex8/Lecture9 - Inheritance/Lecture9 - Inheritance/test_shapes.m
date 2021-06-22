clear all;
close all;
pack;
clc;

%% =============================================
%  Example: my_rectangle class
%  =============================================
rct1 = my_rectangle([0.3,0.9,0.9], 4, 5);
rct2 = my_rectangle([1.0,0.0,0.0], 4, 5);
rct3 = my_rectangle([1.0,0.3,0.0], 3, 4);
rct4 = my_rectangle([1.0,0.6,0.3], 2, 3);
rct5 = my_rectangle([1.0,0.9,0.6], 1, 2);
fh = figure;
plot(rct1,0,0,fh);
hold on;
plot(rct2,3.0,4.0,fh);
plot(rct3,2.5,3.5,fh);
plot(rct4,2.0,3.0,fh);
hold off;
plot(rct5,1.5,2.5,fh);
title(sprintf('A few %1.0f-dimensional shapes',rct1.dim));



%% ============================================
%  Example: my_sphere class
%  ============================================
clear all;
close all;
pack;
clc;

r     = 4;
sphr1 = my_sphere([0.3,1.0,0.0], r);
sphr2 = my_sphere_copy_constructor(sphr1);
sphr1.color = [0.3,1.0,0.5];
% Let's check of the color of sphr2 changed according to the change in sphr1
% spoiler: we will find that it *did not* change, as sphr2 is a new instance of class my_sphere
disp(sphr2);

% Set sphr3 to point to sphr2
sphr3 = sphr2;
disp(sphr3);
sphr2.color = [1,0.5,0];
% Let's check of the color of sphr3 changed according to the change in sphr2...
% spoiler: we will find that it *did* change. This is because sphr3 ***points at*** sphr2
%          rather than being a new instance of class my_sphere. Thus, if you want to have
%          the ability to copy a class object, do it by implementing a copy_constructor!
disp(sphr2);
disp(sphr3);

fh = figure;
plot(sphr1,0,0,0,fh);
hold on;
plot(sphr2,5,5,5,fh);
title(sprintf('Two %1.0f-dimensional shapes',sphr1.dim));

try
	sphr1.dim = 2;
catch
	uiwait(warndlg('Cannot change a class constant property'));
end;


return;