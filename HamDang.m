function [N,dhdr,dhds]=HamDang(xi,eta)
%% Muc dich:
% Tinh ham dang cua phan tu tu giac dang tham so va cac dao ham cua no tai
% cac diem Gauss trong he truc tu nhien
%% Cu phap:
% [N,dhdr,dhds]=HamDang(xi,eta)
%% Mo ta cac bien:
% N ........ Ham dang cua phan tu tu giac bac nhat
% dhdr ..... Dao ham ham dang theo xi 
% dhds ..... Dao ham ham dang theo eta 
% xi ....... Gia tri toa do xi cua diem Gauss
% eta ...... Gia tri toa do eta cua diem Gauss
%% Chu y:
% Toa do nut 1 la (-1,-1), toa do nut 2 la (1,-1)
% Toa do nut 3 la (1,1), toa do nut 4 la (-1,1)
%% Ham dang
N(1)=((eta - 1)*(xi - 1))/4;
N(2)=-((eta - 1)*(xi + 1))/4; 
N(3)=((eta + 1)*(xi + 1))/4; 
N(4)=-((eta + 1)*(xi - 1))/4;
%% Cac dao ham
dhdr(1)=eta/4-1/4;
dhdr(2)=1/4-eta/4;
dhdr(3)=eta/4+1/4;
dhdr(4)=-eta/4-1/4;
dhds(1)=xi/4-1/4;
dhds(2)=-xi/4-1/4;
dhds(3)=xi/4+1/4;
dhds(4)=1/4-xi/4;