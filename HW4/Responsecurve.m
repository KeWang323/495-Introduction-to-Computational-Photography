function [g]=Responsecurve(I,B,r,l)
RGB={' red';' green';' blue'};
Z=zeros(size(I{1},1)*size(I{1},2),size(I,1));
X=zeros(size(I{1},1)*size(I{1},2),size(I,1));
for i=1:size(I,1)
    Z(:,i)=reshape(I{i},size(I{1},1)*size(I{1},2),1);
end
[g,lE]=gsolve(Z,B,l);
for i=1:size(I{1},1)*size(I{1},2)
    for j=1:size(I,1)
        X(i,j)=lE(i)+B(j);
    end
end
ZX(:,1)=reshape(X,size(X,1)*size(X,2),1);
ZX(:,2)=reshape(Z,size(Z,1)*size(Z,2),1);
figure();
plot(ZX(:,1),ZX(:,2),'.','color','b');
hold on
y=0:1:255;
plot(g(y+1),y,'-','color','r','LineWidth',2);
legend('fitted data','response curve','location','northwest');
xlabel('log exposure');
ylabel('pixel value(Z)');
imgname=strcat('Response curve for',RGB(r),' channel');
title(imgname);
end