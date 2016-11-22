function Iout=graytransformation(Iin,k)
Iout=cell(k,1);
for i=1:k
    Iout{i}=rgb2gray(Iin{i});
end