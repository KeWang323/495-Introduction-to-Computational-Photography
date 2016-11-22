%%%%%%Circle motion%%%%%%
clc;
clear;
close all;
video=VideoReader('D:\Courses Files_2015_Fall\Introduction to Computational Photography\HW6\VID_20151129_140828.mp4');
number=video.NumberOfFrames;
n=round(number/5-0.5);
x=zeros(n,1);
y=zeros(n,1);
Frames=cell(n,1);
for i=1:n
    Frames{i}=im2double(rgb2gray(read(video,1+(i-1)*5)));
end
template1=imcrop(Frames{1});
A=normxcorr2(template1,Frames{1});
[a,b]=find(A==max(max(A)));
for i=2:n
    A=normxcorr2(template1,Frames{i});
    [x(i),y(i)]=find(A==max(max(A)));
    x(i)=x(i)-a;
    y(i)=y(i)-b;
end
scatter(y,x,'o');
hold on
plot(y,x,'red');
title('Pixel shift for selected frames');
xlabel('x direction pixel shift');
ylabel('y direction pixel shift');
final=zeros(1080,1920,3);
for i=1:n
    final=final+imtranslate(im2double(read(video,1+(i-1)*5)),[-y(i),-x(i)],'Fillvalues',1);
end
final=final./n;
imshow(final);
imwrite(final,'1.jpg','jpeg')