function Iout=calibrate(Iin,k,U)
Iout=cell(k,1);
for i=1:k
    red=Iin{i}(:,:,1);
    green=Iin{i}(:,:,2);
    blue=Iin{i}(:,:,3);
    [m,n]=size(red);
    mi=U(i)/U(k);
    for a=1:m
        for b=1:n
            if a<=m/2
                a2=round(m/2-abs(a-m/2)*mi);
            end
            if a>m/2
                a2=round(m/2+abs(a-m/2)*mi);
            end
            if b<=n/2
                b2=round(n/2-abs(b-n/2)*mi);
            end
            if b>n/2
                b2=round(n/2+abs(b-n/2)*mi);
            end
            rcalib(a,b)=red(a2,b2);
            gcalib(a,b)=green(a2,b2);
            bcalib(a,b)=blue(a2,b2);
        end
    end
    Iout{i}(:,:,1)=rcalib;
    Iout{i}(:,:,2)=gcalib;
    Iout{i}(:,:,3)=bcalib;
    %     figure(i),imshow(Iout{i});
    imgname=strcat('calibrated',num2str(i),'.jpg');
    imwrite(Iout{i},imgname,'jpeg');
end