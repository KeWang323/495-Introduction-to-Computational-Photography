function [Egamma,Enorm]=HDRimage(E,r)
Enorm=(E-min(min(E)))./(max(max(E))-min(min(E)));
m=size(E,1);
n=size(E,2);
Egamma=zeros(m,n);
for i=1:m
    for j=1:n
        Egamma(i,j)=Enorm(i,j)^r;
    end
end
end