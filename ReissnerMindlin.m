% ReissnerMindlin.m
% Update: 24/12/2016
% Mo ta bai toan:
% Tim bien dang (do vong) cua tam, su dung phan tu tu giac bac 1 
% dang tham so voi ly thuyet chuyen vi cat bac nhat.
% Kich thuoc tam la 400x400 mm va do day 2 mm.
% Vat lieu tam bang thep, tai trong tap trung bang 500 N.
% Bien - mo ta
% nex ......... Tong so phan tu theo phuong x
% ney ......... Tong so phan tu theo phuong y
% ne .......... Tong so phan tu 
% nne ......... So nut cua phan tu
% nn .......... Tong so nut cua ca he
% ndof ........ So bac tu do o moi nut
% len_x ....... Kich thuoc theo phuong x cua tam (mm)
% len_y ....... Kich thuoc theo phuong y cua tam (mm)
% k ........... Ma tran do cung phan tu
% kb .......... Ma tran do cung phan tu (thanh phan chuyen vi uon)
% ks .......... Ma tran do cung phan tu (thanh phan chuyen vi cat)
% f ........... Vector nut phan tu
% gk .......... Ma tran do cung toan cuc
% gp .......... Vector tai toan cuc
% displace .... Vector chuyen vi nut chung
% gcoord ...... Toa do nut toan cuc
% nodes ....... Ma tran dinh vi nut phan tu
% index ....... Ma tran lap ghep
% pointb ...... Ma tran toa do cac diem Gauss cho cac thanh phan uon
% weightb ..... Ma tran trong so cac diem Gauss cho cac thanh phan uon
% pointb ...... Ma tran toa do cac diem Gauss cho cac thanh phan cat
% weightb ..... Ma tran trong so cac diem Gauss cho cac thanh phan cat
% bcdof ....... Vector chuyen vi nut chiu rang buoc voi dieu kien bien
% bcval ....... Vector gia tri chuyen vi nut chiu rang buoc
% B_b ......... Ma tran chuyen vi - ung suat cua cac thanh phan bien dang
% uon
% D_b ......... Ma tran do cung chong cat cua vat lieu
% B_s ......... Ma tran chuyen vi - ung suat cua cac thanh phan bien dang cat
% D_s ......... Ma tran do cung chong cat cua vat lieu
%%
clear all
close all
clc
%% TIEN XU LY
nex=4;      %Tong so phan tu theo phuong x
ney=4;      %Tong so phan tu theo phuong y
ne=nex*ney; %Tong so phan tu  
nne=4;      %So nut cua phan tu
nn=(nex+1)*(ney+1); %Tong so node cua ca he
ndof=3;        %So bac tu do o moi node
edof=nne*ndof; %So bac tu do cua moi phan tu
sdof=nn*ndof;  %Tong so bac tu do cua ca he
E_module=200;  %Modun dan hoi (gPa)
poisson=0.3;   %He so poisson
len_x=400;     %Kich thuoc theo phuong x cua tam (mm)
len_y=400;     %Kich thuoc theo phuong y cua tam (mm)
t=2;           %Chieu day tam (mm)
%Tich phan so 2x2 diem Gauss voi tich phan ma tran do cung uon
nglxb=2; nglyb=2;
%Tich phan so 1x1 diem Gauss voi tich phan ma tran do cung cat
nglxs=1;nglys=1;
%----------------------------------------------------------
%Du lieu toa do nut: gcoord(i,j)
%voi i la chi so nut va j chi toa do x hay y
%----------------------------------------------------------
len_x_elm=len_x/nex; %Khoang cach giua hai nut tren phuong x
len_y_elm=len_y/ney; %Khoang cach giua hai nut tren phuong y
for j=1:(ney+1)
    for i=1:(nex+1)
        nut=(j-1)*(nex+1)+i;
        gcoord(nut,1)=(i-1)*len_x_elm;
        gcoord(nut,2)=(j-1)*len_y_elm;
    end
end
%----------------------------------------------------------
%Du lieu ma tran dinh vi nut phan tu: nodes(i,j)
%voi i la chi so phan tu va j la chi so nut tong the
%----------------------------------------------------------
for j=1:ney
    for i=1:nex
        e=(j-1)*nex+i;
        nodes(e,1)=(j-1)*(nex+1)+i;
        nodes(e,2)=(j-1)*(nex+1)+i+1;
        nodes(e,3)=j*(nex+1)+i+1;
        nodes(e,4)=j*(nex+1)+i;
    end
end
%----------------------------------------------------------
%Du lieu ve dieu kien bien
%----------------------------------------------------------
bcdof=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 ... 
       28 29 30 31 32 33 43 44 45 46 47 48 58 59 60 ...
       61 62 63 64 65 66 67 68 69 70 71 72 73 74 75]; %Cac bac tu do bi rang buoc
bcval=zeros(1,size(bcdof,2));  %Gia tri cac bac tu do bi rang buoc bang 0
%----------------------------------------------------------
%Khoi tao cac vector va cac ma tran
%----------------------------------------------------------
gp=zeros(sdof,1);
gk=zeros(sdof,sdof);
displace=zeros(sdof,1);
B_b=zeros(3,edof);
D_b=zeros(3,3);
B_s=zeros(2,edof);
D_s=zeros(2,2);
%----------------------------------------------------------
%Xay dung vector luc nut tong the
%----------------------------------------------------------
gp(39)=500;   %Luc gay uon dat tai nut so 13
%----------------------------------------------------------
%Du lieu ma tran lap ghep
%----------------------------------------------------------
for iel=1:ne
    for i=1:nne
        nd(i)=nodes(iel,i);  %Xac dinh chi so nut phan tu thu (iel)
    end
    index(iel,1)=nd(1)*ndof-(ndof-1);
    index(iel,2)=index(iel,1)+1;
    index(iel,3)=index(iel,1)+2;
    index(iel,4)=index(iel,1)+3;
    index(iel,5)=index(iel,1)+4;
    index(iel,6)=index(iel,1)+5;
    index(iel,7)=index(iel,4)+(3*nex+3);
    index(iel,8)=index(iel,7)+1;
    index(iel,9)=index(iel,7)+2;
    index(iel,10)=index(iel,1)+(3*nex+3);
    index(iel,11)=index(iel,10)+1;
    index(iel,12)=index(iel,10)+2;
end
%----------------------------------------------------------
%Tinh toan cac ma tran do cung phan tu, vector luc nut phan tu
%va ghep noi phan tu
%----------------------------------------------------------
%Voi do cung chong uon 
%Xac dinh toa do va trong so cua cac diem Gauss
[pointb,weightb]=gaussqd2(nglxb,nglyb);
%xac dinh ma tran do cung chong uon cua vat lieu
D_b=E_module*t^3/(12*(1-poisson^2))*[1 poisson 0;poisson 1 0;...
                                     0 0 (1-poisson)/2];
%Voi do cung chong cat
%Xac dinh toa do va trong so cua cac diem Gauss
[points,weights]=gaussqd2(nglxs,nglys);
G_module=0.5*E_module/(1.0+poisson);   %module cat
shcof=5/6;   %He so hieu chinh cat
%Xac dinh ma tran do cung chong cat cua vat lieu
D_s=G_module*shcof*t*eye(2);
%% XU LY
for iel=1:ne   %Xet tung phan tu
    for i=1:nne
        nd(i)=nodes(iel,i);    %Xac dinh chi so nut phan tu thu (iel)
        xcoord(i)=gcoord(nd(i),1); %Xac dinh toa do x cua nut phan tu
        ycoord(i)=gcoord(nd(i),2); %Xac dinh toa do y cua nut phan tu
    end
    k=zeros(edof,edof);  %Khoi tao ma tran do cung phan tu
    kb=zeros(edof,edof); %Khoi tao ma tran do cung uon phan tu
    ks=zeros(edof,edof); %Khoi tao ma tran do cung cat phan tu
    %----------------------------------------------------------
    %Tinh tich phan so cua ma tran cac thanh phan bien dang uon
    %----------------------------------------------------------
    for intx=1:nglxb
        x=pointb(intx,1); %Toa do x diem Gauss
        wtx=weightb(intx,1);   %Trong so cua diem Gauss theo phuong x
        for inty=1:nglyb
            y=pointb(inty,2);  %Toa do y diem Gauss
            wty=weightb(inty,2);  %Trong so diem Gauss theo phuong y
            %Tinh cac ham dang va dao ham ham dang tai cac diem Gauss
            [shape,dhdr,dhds]=HamDang(x,y);
            jacob2=transposejacobi(dhdr,dhds,...
                   xcoord,ycoord);%Chuyen vi cua ma tran jacobi
            detjacob=det(transpose(jacob2)); %Dinh thuc ma tran Jacobi
            invjacob=inv(jacob2); %Nghich dao chuyen vi cua ma tran Jacobi
            %Xac dinh dao ham ham dang trong he truc vat ly
            for i=1:nne
                dhdx(i)=invjacob(1,1)*dhdr(i)+invjacob(1,2)*dhds(i);
                dhdy(i)=invjacob(2,1)*dhdr(i)+invjacob(2,2)*dhds(i);
            end
            %Xac dinh ma tran bien dang – chuyen vi cac thanh phan uon
            B_b=Bb_matrix(nne,dhdx,dhdy);
            %Tinh ma tran do cung phan tu uon
            kb=kb+B_b'*D_b*B_b*wtx*wty*detjacob;
        end
    end 
    %----------------------------------------------------------
    %Tinh tich phan so cua ma tran cac thanh phan bien dang cat
    %----------------------------------------------------------
    for intx=1:nglxs
        x=points(intx,1); %Toa do x diem Gauss
        wtx=weights(intx,1); %Trong so cua diem Gauss theo phuong x
        for inty=1:nglys
            y=points(inty,2); %Toa do y diem Gauss
            wty=weights(inty,2); %Trong so cua diem Gauss theo phuong y
            %Tinh cac ham dang va dao ham ham dang tai cac diem Gauss
            [shape,dhdr,dhds]=HamDang(x,y);
            jacob2=transposejacobi(dhdr,dhds,...
                   xcoord,ycoord); %Chuyen vi cua ma tran jacobi
            detjacob=det(transpose(jacob2)); %Dinh thuc ma tran Jacobian
            invjacob=inv(jacob2); %Nghich dao chuyen vi cua ma tran Jacobi
            %Xac dinh dao ham ham dang trong he truc vat ly
            for i=1:nne
                dhdx(i)=invjacob(1,1)*dhdr(i)+invjacob(1,2)*dhds(i);
                dhdy(i)=invjacob(2,1)*dhdr(i)+invjacob(2,2)*dhds(i);
            end
            %Xac dinh ma tran bien dang – chuyen vi cac thanh phan cat
            B_s=Bs_matrix(nne,dhdx,dhdy,shape);
            %----------------------------------------
            %Tinh ma tran do cung phan tu cat
            %----------------------------------------
            ks=ks+B_s'*D_s*B_s*wtx*wty*detjacob;
        end
    end 
    %----------------------------------------------------------
    %Tinh ma tran do cung phan tu
    %----------------------------------------------------------
    k=kb+ks;
    %----------------------------------------------------------
    %Tinh ma tran do cung toan cuc
    %----------------------------------------------------------
    for i=1:edof
        for j=1:edof
            gk(index(iel,i),index(iel,j))=gk(index(iel,i),index(iel,j))+...
                                          k(i,j);
        end
    end
end
%----------------------------------------------------------
%Ap dat dieu kien bien
%----------------------------------------------------------
[gk,gp]=boundary_aply_2D(gk,gp,bcdof,bcval);
%----------------------------------------------------------
%Giai he phuong trinh phan tu huu han
%----------------------------------------------------------
displace=inv(gk)*gp;
%% HAU XU LY
%----------------------------------------------------------
%Xuat chuyen dich
%----------------------------------------------------------
disp(sprintf('%s','Chuyen vi nut        Gia tri'))
for num=1:sdof
    disp(sprintf('\t%d\t\t\t\t %f', num, displace(num)));
end
%----------------------------------------------------------
%Ve do thi chuyen dich
%----------------------------------------------------------
x=0:400/nex:400;
y=0:400/ney:400;
w=displace(3:3:end);
for i=1:(ney+1)
    for j=1:(nex+1)
        z(i,j)=w((i-1)*(nex+1)+j);
    end
end
surf(x,y,z) 














        