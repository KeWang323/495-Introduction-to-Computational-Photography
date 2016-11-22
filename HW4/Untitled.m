clear;
clc;
a=imread('D:\Courses Files\Introduction to Computational Photography\HW4\2150400.jpg');
r=a(:,:,1);
g=a(:,:,2);
b=a(:,:,3);
nr=0;
ng=0;
nb=0;
for i=1:1944
    for j=1:2592
        if r(i,j)==255
            nr=nr+1;
        end
    end
end
for i=1:1944
    for j=2592
        if g(i,j)==255
            ng=ng+1;
        end
    end
end
for i=1:1944
    for j=1:2592
        if b(i,j)==255
            nb=nb+1;
        end
    end
end

