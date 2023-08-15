function transposejacobi=transposejacobi(dhdr,dhds,xcoord,ycoord)
%% Muc dich
% Tinh ma tran jacobi chuyen vi cua phep bien doi tu phan tu tham chieu
% sang phan tu thuc
%% Cu phap
% transposejacobi=transposejacobi(dhdr,dhds,xcoord,ycoord)
%% Mo ta cac bien
% dhdr ..... Dao ham ham dang theo xi 
% dhds ..... Dao ham ham dang theo eta 
% xcoord ... Vector xac dinh gia tri toa do x cua nut phan tu
% ycoord ... Vector xac dinh gia tri toa do y cua nut phan tu
%% Tinh cac phan tu cua ma tran chuyen vi cua jacobi
transposejacobi(1,1)=dhdr(1)*xcoord(1)+dhdr(2)*xcoord(2)+...
            dhdr(3)*xcoord(3)+dhdr(4)*xcoord(4);
transposejacobi(1,2)=dhdr(1)*ycoord(1)+dhdr(2)*ycoord(2)+...
            dhdr(3)*ycoord(3)+dhdr(4)*ycoord(4);
transposejacobi(2,1)=dhds(1)*xcoord(1)+dhds(2)*xcoord(2)+...
            dhds(3)*xcoord(3)+dhds(4)*xcoord(4);
transposejacobi(2,2)=dhds(1)*ycoord(1)+dhds(2)*ycoord(2)+...
            dhds(3)*ycoord(3)+dhds(4)*ycoord(4);
