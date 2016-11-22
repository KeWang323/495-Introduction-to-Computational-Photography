clear;
clc;
k=3;
Iori=cell(k,1);
U=zeros(k,1);
f=2.95;
Vkstack=[1.5^4;1.5^5;1.5^6];
for i=1:k
    U(i)=1/(339-Vkstack(i));
end
for i=1:k
    imgname=strcat('D:\Courses Files_2015_Fall\Introduction to Computational Photography\HW5\',num2str(i),'.jpg');
    Iori{i}=im2double(imread(imgname));
end
Icalib=calibrate(Iori,k,U);
Igray=graytransformation(Icalib,k);
Ilaplacian=Laplacian(Igray,k);
IM=recover(Ilaplacian,k,5);
[Imap,Icomb]=compare(IM);
[m,n]=size(Imap);
Ifinal=zeros(m,n,3);
for i=1:m
    for j=1:n
        Ifinal(i,j,1)=Iori{Imap(i,j)}(i,j,1);
        Ifinal(i,j,2)=Iori{Imap(i,j)}(i,j,2);
        Ifinal(i,j,3)=Iori{Imap(i,j)}(i,j,3);
    end
end
figure(),imshow(Ifinal);
imwrite(Ifinal,'Ifinal.jpg','jpeg');



