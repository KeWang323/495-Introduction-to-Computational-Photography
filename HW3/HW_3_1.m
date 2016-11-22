%%%%%% 1st step comparing different settings %%%%%%
clear;
clc;
image=imread('C:\Users\Ke Wang\Desktop\IMG_6111.JPG');

image=im2double(image);
figure(),imshow(image);
imager=image(:,:,1);
imageg=image(:,:,2);
imageb=image(:,:,3);

sigmas=[1 4 16 32 64 128];
sigmar=[0.05 0.1 0.2];

% outr=bilateralFilter(imager);
% outg=bilateralFilter(imageg);
% outb=bilateralFilter(imageb);
% out(:,:,1)=outr;
% out(:,:,2)=outg;
% out(:,:,3)=outb;
% figure(1),imshow(out);
% imwrite(out,'f default.jpg','jpeg');
% 
outr=bilateralFilter(imager,32,0.05);
outg=bilateralFilter(imageg,32,0.05);
outb=bilateralFilter(imageb,32,0.05);
out(:,:,1)=outr;
out(:,:,2)=outg;
out(:,:,3)=outb;
figure(2),imshow(out);
% imwrite(out,'nf 64 0.05.jpg','jpeg');
% 
% outr=bilateralFilter(imager,32,0.05);
% outg=bilateralFilter(imageg,32,0.05);
% outb=bilateralFilter(imageb,32,0.05);
% out(:,:,1)=outr;
% out(:,:,2)=outg;
% out(:,:,3)=outb;
% figure(3),imshow(out);
% imwrite(out,'nf 32 0.05.jpg','jpeg');
% 
% outr=bilateralFilter(imager,16,0.05);
% outg=bilateralFilter(imageg,16,0.05);
% outb=bilateralFilter(imageb,16,0.05);
% out(:,:,1)=outr;
% out(:,:,2)=outg;
% out(:,:,3)=outb;
% figure(4),imshow(out);
% imwrite(out,'nf 16 0.05.jpg','jpeg');
% 
% outr=bilateralFilter(imager,4,0.05);
% outg=bilateralFilter(imageg,4,0.05);
% outb=bilateralFilter(imageb,4,0.05);
% out(:,:,1)=outr;
% out(:,:,2)=outg;
% out(:,:,3)=outb;
% figure(5),imshow(out);
% imwrite(out,'nf 4 0.05.jpg','jpeg');
% 
% outr=bilateralFilter(imager,1,0.05);
% outg=bilateralFilter(imageg,1,0.05);
% outb=bilateralFilter(imageb,1,0.05);
% out(:,:,1)=outr;
% out(:,:,2)=outg;
% out(:,:,3)=outb;
% figure(6),imshow(out);
% imwrite(out,'nf 1 0.05.jpg','jpeg');