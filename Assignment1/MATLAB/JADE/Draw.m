clc;clear;
[x,y] = meshgrid(0:0.01:1.6,0:0.01:1);
z = 2*x+y;
contour(x,y,z);
hold on;
syms x y
g1 = -x.^2-y+1.25;
g2 = x+y-1.6;


