%/////////Codes of Question 2 go as follows.//////////%
clc;
clear;
I=cell(1,50);
A=[ 500,600;
    800,1200;
    1200,1800
    1500,2400];%the 4 positions of points to be shown and image size is 1944*2592
B=zeros(50,4);%store values and 4 columns for 4 points
for i=1:50%load 50 images at a time
    %Image_lowSen or Image_highSen
    imgname=strcat('D:\Courses Files\Introduction to Computational Photography\HW2\pattern_High2\',num2str(i),'.dng');
    I{i}=imread(imgname);
end

for i=1:4%store the values of each points
    for j=1:50
        B(j,i)=I{j}(A(i,1),A(i,2));
    end
end
figure(1);
suptitle('values of different pixels(HighSen)');
% suptitle('values of different pixels(LowSen)');
subplot(2,2,1);
hist(B(:,1));
xlabel('Value');
ylabel('Quantity');

subplot(2,2,2);
hist(B(:,2));
xlabel('Value');
ylabel('Quantity');

subplot(2,2,3);
hist(B(:,3));
xlabel('Value');
ylabel('Quantity');

subplot(2,2,4);
hist(B(:,4));
xlabel('Value');
ylabel('Quantity');