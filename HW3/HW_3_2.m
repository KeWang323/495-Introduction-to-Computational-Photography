%%%%%% 2nd step fusing images %%%%%%

clear;
clc;
Fd=imread('D:\Courses Files\Introduction to Computational Photography\HW3\f default.jpg');
F=imread('D:\Courses Files\Introduction to Computational Photography\HW3\original photos\flash.jpg');
Ad=imread('D:\Courses Files\Introduction to Computational Photography\HW3\nf default.jpg');

Fr=(F(:,:,1)+0.02)./(Fd(:,:,1)+0.02);
Fg=(F(:,:,2)+0.02)./(Fd(:,:,2)+0.02);
Fb=(F(:,:,3)+0.02)./(Fd(:,:,3)+0.02);

Af(:,:,1)=Ad(:,:,1).*Fr;
Af(:,:,2)=Ad(:,:,2).*Fg;
Af(:,:,3)=Ad(:,:,3).*Fb;

imshow(Af);
imwrite(Af,'Af default.jpg','jpeg');
