function [B_s]=Bs_matrix(nne,diff_N_x,diff_N_y,N)
%% Muc dich:
% Xac dinh ma tran chuyen vi – bien dang cua cac thanh phan bien dang cat
% theo ly thuyet chuyen vi bac nhat co ke den bien dang cat
%% Cu phap:
% [B_s]=Bs_matrix(nne,diff_N_x,diff_N_y,N)
%% Mo ta cac bien:
% nne ......... So nut cua phan tu
% diff_N_x .... Dao ham ham dang theo x
% diff_N_y .... Dao ham ham dang theo y
% N ........... Ham dang
%------------------------------------------------------------------------
for i=1:nne
    i1=(i-1)*3+1;
    i2=i1+1;
    i3=i2+1;
    B_s(1,i1)=-N(i);
    B_s(1,i3)=diff_N_x(i);
    B_s(2,i2)=-N(i);
    B_s(2,i3)=diff_N_y(i);
end