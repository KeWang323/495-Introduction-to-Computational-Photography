function [E,E10,Eo]=map(I,B,g)
m=size(I{1},1);
n=size(I{1},2);
E=zeros(m,n);
for i=1:m
    for j=1:n
        for k=1:size(B,1)
            gz=g(I{k}(i,j)+1);
            E(i,j)=E(i,j)+gz-B(k);
        end
        E(i,j)=E(i,j)/5;
    end
end
E10=log10(exp(E));
Eo=exp(E);
end