%/////////Codes of Question 3 go as follows.//////////%
clc;
clear;
num=49;
I=cell(1,num);

for i=1:num%load 50 images at a time
    %Image_lowSen or Image_highSen
    imgname=strcat('D:\Courses Files\Introduction to Computational Photography\HW2\pattern_High2\',num2str(i),'.dng');
    I{i}=im2double(imcrop(imread(imgname),[1350,830,870,1000]));% find the interesting area--the pattern area
end

[H,W]=size(I{1});
A=zeros(H,W);%mean matrix
B=zeros(H,W);%varience matrix

for i=1:H
    for j=1:W
        C=0;
        for k=1:num
            C=C+I{k}(i,j);
        end
        A(i,j)=C/num;%mean
    end
end

for i=1:H
    for j=1:W
        C=0;
        for k=1:num
            C=C+(I{k}(i,j)-A(i,j))^2;
        end
        B(i,j)=C/num;%mean
    end
end
figure(1);
subplot(2,2,1);
imagesc(A);
title('mean image');
C=reshape(A,1,H*W);%change dimension of mean metrix
subplot(2,2,2);
imagesc(B);
title('variance image');
subplot(2,2,3);
imagesc(I{1});
title('original image');
subplot(2,2,4);
imagesc(I{2});
title('original image');

%/////////Codes of Question 4 and 5 go as follows.//////////%
D=reshape(B,1,H*W);%change the dimension 
figure(2);
c=find(C==min(C));%shift min u to zero point
C=C-C(c(1));
plot(C,D,'.','color','red');
axis([0,max(max(C)),0, max(max(D))]);
xlabel('米');
ylabel('考^2');
title('考^2-米(without averaging 考^2 for same 米)');

[E,ind]=sort(C);
Eround=roundn(E,-4);
j=1;
k=1;
a=0;
n=0;
i=1;
while i<(H*W)%averaging varience of same u 
	n=length(find(Eround==Eround(i)));
	for j=i:(n+i-1)
        a=a+D(ind(j));
    end
	F(k)=Eround(i);
	G(k)=a/n;
	k=k+1;
	i=i+n;
    a=0;
end

figure(3);
plot(F,G,'.','color','red');
p = polyfit(F,G,1);
hold on   
x=0:(max(max(F)))/1000:max(max(F));
y=p(1)*x+p(2);
plot(x,y);
axis([0,max(max(F)),0,max(max(D))]);
title('考^2-米')
legend('data','fitting curve','location','northeast')
xlabel('米');
ylabel('考^2');

%/////////Codes of Question 7 go as follows.//////////%
figure(4);
b=20*log10(F./(G).^0.5);
plot(F,b);
xlabel('米');
ylabel('SNR=20log(S/考)');
title('考^2-米');