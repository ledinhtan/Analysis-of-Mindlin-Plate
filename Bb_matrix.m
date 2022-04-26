function [B_b]=Bb_matrix(nne,diff_N_x,diff_N_y)
%% Muc dich:
% Xac dinh ma tran chuyen vi – bien dang cua cac thanh phan bien dang uon
% theo ly thuyet chuyen vi bac nhat co ke den bien dang cat
%% Cu phap:
% [B_b]=Bb_matrix(nne,diff_N_x,diff_N_y)
%% Mo ta cac bien
% nne .......... So nut cua phan tu
% diff_N_x ..... Dao ham ham dang theo x
% diff_N_y ..... Dao ham ham dang theo y
%%
for i=1:nne
    i1=(i-1)*3+1;
    i2=i1+1;
    i3=i2+1;
    B_b(1,i1)=diff_N_x(i);
    B_b(2,i2)=diff_N_y(i);
    B_b(3,i1)=diff_N_y(i);
    B_b(3,i2)=diff_N_x(i);
    B_b(3,i3)=0;
end