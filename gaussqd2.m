function [point,weight]=gaussqd2(nx,ny)
%-------------------------------------------------------------------
% Muc dich
% Xac dinh diem cau phuong va trong luong
% cua quy tac cau phuong Gauss 2-chieu
% Cu phap:
% [point,weight]=gaussqd2(nx,ny)
% Mo ta bien:
% nx - so diem cau phuong tren truc x
% ny - so diem cau phuong tren truc y
% point - vecto chua cac diem cau phuong
% weight - vecto chua cac trong luong
%-------------------------------------------------------------------
% Xac dinh gia tri lon nhat cua nx, ny
if nx > ny
    n=nx;
    point=zeros(n,1);
else
    n=ny;
end
%-------------------------------------------------------------------
% Khoi tao
point=zeros(n,2);
weight=zeros(n,2);
%-------------------------------------------------------------------
% Diem cau phuong va trong luong tuong ung
[pointx,weightx]=gaussqd1(nx);
[pointy,weighty]=gaussqd1(ny);
%-------------------------------------------------------------------
for intx=1:nx
    point(intx,1)=pointx(intx);
    weight(intx,1)=weightx(intx);
end
for inty=1:ny
    point(inty,2)=pointy(inty);
    weight(inty,2)=weighty(inty);
end
end