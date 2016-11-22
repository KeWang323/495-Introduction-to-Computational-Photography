function [Iout1,Iout2]=compare(Iin)
[m,n]=size(Iin{1});
Iout1=zeros(m,n);
Iout2=Iin{1};
for i=1:m
    for j=1:n
        Iout1(i,j)=1;
        if Iin{2}(i,j)>Iin{1}(i,j)
            Iout1(i,j)=2;
            Iout2(i,j)=Iin{2}(i,j);
        end
        if Iin{3}(i,j)>Iin{2}(i,j)
            Iout1(i,j)=3;
            Iout2(i,j)=Iin{3}(i,j);
        end
    end
end
imwrite(Iout2,'depth index map.jpg','jpeg');
end