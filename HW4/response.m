clear;
clc;
B=[67200;
134400;
268800;
537600;
1075200;
2150400
    ];
B=B*10^-9;
k=size(B,1);
for i=1:k
    B(i)=log(B(i));
end

Io=cell(k,1);

Ior=cell(k,1);
Iog=cell(k,1);
Iob=cell(k,1);

Icr=cell(k,1);
Icg=cell(k,1);
Icb=cell(k,1);
p=randperm(1000);
for k=1:6
    imgname=strcat('D:\Courses Files\Introduction to Computational Photography\HW4\新建文件夹\',num2str(k),'.jpg');
    
    Io{k}=imread(imgname);
    
    Ior{k}=Io{k}(:,:,1);
    Iog{k}=Io{k}(:,:,2);
    Iob{k}=Io{k}(:,:,3);

    Icr{k}=Ior{k}(339,:);
    Icg{k}=Iog{k}(339,:);
    Icb{k}=Iob{k}(339,:);
end

[gr]=Responsecurve(Icr,B,1,5);
[gg]=Responsecurve(Icg,B,2,5);
[gb]=Responsecurve(Icb,B,3,5);

[Er,Er10,Ero]=map(Ior,B,gr);
[Eg,Eg10,Ego]=map(Iog,B,gg);
[Eb,Eb10,Ebo]=map(Iob,B,gb);
figure(),imagesc(Er10);colorbar;title('red channel');
figure(),imagesc(Eg10);colorbar;title('green channel');
figure(),imagesc(Eb10);colorbar;title('blue channel');

[Ergamma,Ernorm]=HDRimage(Ero,0.3);
figure(),imagesc(Ergamma);colorbar;
[Eggamma,Egnorm]=HDRimage(Ego,0.3);
figure(),imagesc(Eggamma);colorbar;
[Ebgamma,Ebnorm]=HDRimage(Ebo,0.3);
figure(),imagesc(Ebgamma);colorbar;

Enormrgb(:,:,1)=Ernorm;
Enormrgb(:,:,2)=Egnorm;
Enormrgb(:,:,3)=Ebnorm;

Egamma(:,:,1)=Ergamma;
Egamma(:,:,2)=Eggamma;
Egamma(:,:,3)=Ebgamma;


L=rgb2gray(Enormrgb);
Lavg=0;
for i=1:size(L,1)
    for j=1:size(L,2)
        Lavg=Lavg+log(L(i,j));
    end
end
Lavg=exp(Lavg/(size(L,1)*size(L,2)));
T=0.18/Lavg.*L;
Ltone=T.*(1+T./(max(max(T)))^2)./(1+T);
M=Ltone./L;
Rnew=M.*Ernorm;
Gnew=M.*Egnorm;
Bnew=M.*Ebnorm;
New(:,:,1)=Rnew;
New(:,:,2)=Gnew;
New(:,:,3)=Bnew;
figure(),imshow(New);
title('New');
figure(),imshow(Egamma);
title('Gamma');
figure(),imshow(Enormrgb);
title('Enormrgb');
imwrite(New,'New.jpg','jpeg');
imwrite(Egamma,'Gamma.jpg','jpeg');
imwrite(Enormrgb,'Enormrgb.jpg','jpeg');
