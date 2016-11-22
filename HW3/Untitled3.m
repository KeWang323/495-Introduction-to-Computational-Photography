clear;
clc;
image=imread('C:\Users\Ke Wang\Desktop\IMG_6111.JPG');
image=im2double(image);
figure(1),imshow(image);
imager=image(:,:,1);
imageg=image(:,:,2);
imageb=image(:,:,3);

hr=medfilt2(imager);
hg=medfilt2(imageg);
hb=medfilt2(imageb);

out(:,:,1)=hr;
out(:,:,2)=hg;
out(:,:,3)=hb;
figure(2),imshow(out);

d0=160;
h=zeros(1280,960);
for i=1:1280
    for j=1:960
        d=sqrt((i-1280/2)^2+(j-960/2)^2);
        h(i,j)=exp(-d^2/(2*d0^2));
    end
end

ffthr=fft2(hr);
sffthr=fftshift(ffthr);
sffthrh=sffthr.*h;
ffthr=ifftshift(sffthrh);
hrh=ifft2(ffthr);

ffthg=fft2(hg);
sffthg=fftshift(ffthg);
sffthg=sffthg.*h;
ffthg=ifftshift(sffthg);
hgh=ifft2(ffthg);

ffthb=fft2(hb);
sffthb=fftshift(ffthb);
sffthb=sffthb.*h;
ffthb=ifftshift(sffthb);
hbh=ifft2(ffthb);

outh(:,:,1)=hrh;
outh(:,:,2)=hgh;
outh(:,:,3)=hbh;
figure(3),imshow(outh);
imwrite(outh,'outh.jpg','jpeg');