function Iout=recover(Iin,k,K)
Iout=cell(k,1);
[m,n]=size(Iin{1});
for i=1:k
    Iout{i}=zeros(m,n);
end
for a=1:k
    for b=1:m
        for c=1:n
            for i=-K:K
                for j=-K:K
                    d=b+i;
                    e=c+j;
                    while d<=0
                        d=d+1;
                    end
                    while d>m
                        d=d-1;
                    end
                    while e<=0
                        e=e+1;
                    end
                    while e>n
                        e=e-1;
                    end
                    Iout{a}(b,c)=Iout{a}(b,c)+Iin{a}(d,e);
                end
            end
        end
    end
    imgname=strcat('M k= ',num2str(a),'.jpg');
    imwrite(Iout{a},imgname,'jpeg');
end
end