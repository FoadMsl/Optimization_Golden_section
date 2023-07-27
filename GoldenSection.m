% =================================================
%       Foad Moslem (foad.moslem@gmail.com) - Researcher | Aerodynamics
%       Using MATLAB R2022a
% =================================================
clc
clear
close all

% =================================================
tic
global numFunc
numFunc = 0;

% CurvePloting ======================================
a = 0;
b = 4;
NumOfNodes = 200;
x = linspace(a,b,NumOfNodes);
y = ObjFun(x);
plot(x,y)
hold on

% Main Code - Golden Section ==========================
a1 = a;
b1 = b;
tau=double((-1+sqrt(5))/2);
epsilon = 1e-6;
l = abs (a1-b1);

x1 = tau*a1 + (1-tau)*b1;
x2 = tau*b1 + (1-tau) *a1;
fx1 = ObjFun(x1);
fx2 = ObjFun(x2);

while l > epsilon
    l = abs (a1-b1);
    if fx1 > fx2
        a1 = x1;
        x1 = x2;
        fx1 = fx2;
        x2 = tau*b1 + (1-tau)*a1;
        fx2 = ObjFun(x2);
    elseif fx2 >= fx1
        b1= x2;
        x2 = x1;
        fx2 = fx1;
        x1 = tau*a1 + (1-tau)*b1;
        fx1 = ObjFun(x1);
    end
end
xm = (a1+b1)/2;
fxm = ObjFun(xm);

% =================================================
fprintf('Number of CallFunction: %6.f\n',numFunc)
fprintf('CPU time: %6.4f\n',toc)
fprintf('X Value of Optimum Point: %6.4f\n',xm)
fprintf('Y Value of Optimum Point: %6.4f\n',fxm)
plot(xm,fxm,'kx')