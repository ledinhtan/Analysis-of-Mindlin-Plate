function [gk,gp]=boundary_aply_2D(gk,gp,bcdof,bcval)
%% Muc dich:
% Ap dat dieu kien bien vao he phuong trinh [gk]{x}={gp}
%% Cu phap:
% [gk,gp]=boundary_aply_2D(gk,gp,bcdof,bcval)
% Mo ta cac bien:
% gk ........ Ma tran do cung chung truoc khi loai hang va cot
% gp ........ Vector luc nut chung truoc khi loai hang
% bcdof ..... Vector chua cac bac tu do bi rang buoc boi dieu kien bien
% bcval ..... Vector chua gia tri cac rang buoc
%-----------------------------------------------------------
for i=1:length(bcdof)
    c=bcdof(i);
    for j=1:size(gk)
        gk(c,j)=0;
        gk(j,c)=0;
    end
    gk(c,c)=1;
    gp(c)=bcval(i);
end
