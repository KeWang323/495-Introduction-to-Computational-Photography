function Iout=Laplacian(Iin,k)
Iout=cell(k,1);
mask=[1 4 1;
    4 -20 4
    1 4 1]/6;
for i=1:k
    Iout{i}=imfilter(Iin{i},mask,'replicate');
    Iout{i}=Iout{i}.*Iout{i};
end