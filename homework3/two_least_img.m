img=imread('test.jpg');
[m,n]=size(img);
count = 1;
%Roberts����һ�׵������Ե��
array=zeros(m,n);
for i=2:m-1
    for j=2:n-1
        array(i,j)=abs(img(i+1,j+1)-img(i,j))+abs(img(i,j+1)-img(i+1,j));
        if array(i,j)<1
            array(i,j)=0;
        else
            array(i,j)=255;   
            x(count)=i;
            y(count)=j;
           count = count + 1;
        end
    end
end
imshow('test.jpg');hold on;
point_size = size(x,2);
%��С���˷�ϵ��
x2=sum(x.^2);       % ��(xi^2)
x1=sum(x);          % ��(xi)
x1y1=sum(x.*y);     % ��(xi*yi)
y1=sum(y);          % ��(yi)
a=(point_size * x1y1 - x1*y1)/(point_size*x2 - x1*x1);      %���ֱ��б��b=(y1-a*x1)/n
b=(y1 - a*x1)/ point_size;                      %���ֱ�߽ؾ�
new_y = a*x+b;
plot(x,new_y,'r');
title(['��С���˷���ϳ���ֱ��Ϊ: y = ',num2str(a),'x + ',num2str(b)]);