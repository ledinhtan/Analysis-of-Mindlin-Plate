clear all
clc
%%
syms xi eta x1 x2 x3 x4 y1 y2 y3 y4
N1=((eta - 1)*(xi - 1))/4;
N2=-((eta - 1)*(xi + 1))/4;
N3=((eta + 1)*(xi + 1))/4;
N4=-((eta + 1)*(xi - 1))/4;
Jmat_transpose=[diff(N1,xi),diff(N2,xi),diff(N3,xi),diff(N4,xi);...
                diff(N1,eta),diff(N2,eta),diff(N3,eta),diff(N4,eta)]...
                *[x1,y1;x2,y2;x3,y3;x4,y4];
diff_N=inv(Jmat_transpose)*[diff(N1,xi),diff(N2,xi),diff(N3,xi),diff(N4,xi);...
                diff(N1,eta),diff(N2,eta),diff(N3,eta),diff(N4,eta)]
            
            
% diff_N1x=(y2 - y4 - eta*y2 + eta*y3 - xi*y3 + xi*y4)/(x1*y2 - x2*y1 - x1*y4 + x2*y3 - x3*y2 + x4*y1 + x3*y4 - x4*y3 - eta*x1*y2 + eta*x2*y1 + eta*x1*y3 - eta*x3*y1 - eta*x2*y4 + eta*x4*y2 + eta*x3*y4 - eta*x4*y3 - x1*xi*y3 + x3*xi*y1 + x1*xi*y4 + x2*xi*y3 - x3*xi*y2 - x4*xi*y1 - x2*xi*y4 + x4*xi*y2);
% diff_N2x=-(y1 - y3 - eta*y1 + eta*y4 - xi*y3 + xi*y4)/(x1*y2 - x2*y1 - x1*y4 + x2*y3 - x3*y2 + x4*y1 + x3*y4 - x4*y3 - eta*x1*y2 + eta*x2*y1 + eta*x1*y3 - eta*x3*y1 - eta*x2*y4 + eta*x4*y2 + eta*x3*y4 - eta*x4*y3 - x1*xi*y3 + x3*xi*y1 + x1*xi*y4 + x2*xi*y3 - x3*xi*y2 - x4*xi*y1 - x2*xi*y4 + x4*xi*y2);
% diff_N3x=-(y2 - y4 + eta*y1 - eta*y4 - xi*y1 + xi*y2)/(x1*y2 - x2*y1 - x1*y4 + x2*y3 - x3*y2 + x4*y1 + x3*y4 - x4*y3 - eta*x1*y2 + eta*x2*y1 + eta*x1*y3 - eta*x3*y1 - eta*x2*y4 + eta*x4*y2 + eta*x3*y4 - eta*x4*y3 - x1*xi*y3 + x3*xi*y1 + x1*xi*y4 + x2*xi*y3 - x3*xi*y2 - x4*xi*y1 - x2*xi*y4 + x4*xi*y2);
% diff_N4x=(y1 - y3 + eta*y2 - eta*y3 - xi*y1 + xi*y2)/(x1*y2 - x2*y1 - x1*y4 + x2*y3 - x3*y2 + x4*y1 + x3*y4 - x4*y3 - eta*x1*y2 + eta*x2*y1 + eta*x1*y3 - eta*x3*y1 - eta*x2*y4 + eta*x4*y2 + eta*x3*y4 - eta*x4*y3 - x1*xi*y3 + x3*xi*y1 + x1*xi*y4 + x2*xi*y3 - x3*xi*y2 - x4*xi*y1 - x2*xi*y4 + x4*xi*y2);
% diff_N1y=-(x2 - x4 - eta*x2 + eta*x3 - x3*xi + x4*xi)/(x1*y2 - x2*y1 - x1*y4 + x2*y3 - x3*y2 + x4*y1 + x3*y4 - x4*y3 - eta*x1*y2 + eta*x2*y1 + eta*x1*y3 - eta*x3*y1 - eta*x2*y4 + eta*x4*y2 + eta*x3*y4 - eta*x4*y3 - x1*xi*y3 + x3*xi*y1 + x1*xi*y4 + x2*xi*y3 - x3*xi*y2 - x4*xi*y1 - x2*xi*y4 + x4*xi*y2);
% diff_N2y=(x1 - x3 - eta*x1 + eta*x4 - x3*xi + x4*xi)/(x1*y2 - x2*y1 - x1*y4 + x2*y3 - x3*y2 + x4*y1 + x3*y4 - x4*y3 - eta*x1*y2 + eta*x2*y1 + eta*x1*y3 - eta*x3*y1 - eta*x2*y4 + eta*x4*y2 + eta*x3*y4 - eta*x4*y3 - x1*xi*y3 + x3*xi*y1 + x1*xi*y4 + x2*xi*y3 - x3*xi*y2 - x4*xi*y1 - x2*xi*y4 + x4*xi*y2);
% diff_N3y=(x2 - x4 + eta*x1 - eta*x4 - x1*xi + x2*xi)/(x1*y2 - x2*y1 - x1*y4 + x2*y3 - x3*y2 + x4*y1 + x3*y4 - x4*y3 - eta*x1*y2 + eta*x2*y1 + eta*x1*y3 - eta*x3*y1 - eta*x2*y4 + eta*x4*y2 + eta*x3*y4 - eta*x4*y3 - x1*xi*y3 + x3*xi*y1 + x1*xi*y4 + x2*xi*y3 - x3*xi*y2 - x4*xi*y1 - x2*xi*y4 + x4*xi*y2);
% diff_N4y=-(x1 - x3 + eta*x2 - eta*x3 - x1*xi + x2*xi)/(x1*y2 - x2*y1 - x1*y4 + x2*y3 - x3*y2 + x4*y1 + x3*y4 - x4*y3 - eta*x1*y2 + eta*x2*y1 + eta*x1*y3 - eta*x3*y1 - eta*x2*y4 + eta*x4*y2 + eta*x3*y4 - eta*x4*y3 - x1*xi*y3 + x3*xi*y1 + x1*xi*y4 + x2*xi*y3 - x3*xi*y2 - x4*xi*y1 - x2*xi*y4 + x4*xi*y2);