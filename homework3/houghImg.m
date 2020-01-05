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
data = [x;y];
%����任����
n_max=100;%����ռ���������ֵ  
h=zeros(315,2*n_max);  
theta_i=1; 
sigma=70;%�����ֵ 
for theta = 0:0.1:pi
    p=[-sin(theta),cos(theta)];  
    d=p*data;  
    for i=1:point_size  
        %�Ի���ռ��е�dֵ��������  
        h(theta_i,round(d(i)/10+n_max))=h(theta_i,round(d(i)/10+n_max))+1;  
    end  
    theta_i=theta_i+1;  
end
[theta_x,p]=find(h>sigma);%����ͶƱ������sigma��λ��
line_size=size(theta_x);%����ֱ������
r=(p-n_max)*10;%��ԭ����R 
x_line = min(data(:)):0.01:max(data(:)); 
for i=1:40:line_size  
    %б�ʲ����ڵ����
    if(abs(cos(theta_x(i)))<0.01)  
        x=r(i);y=-1:1;  
        plot(x,y,'r');  
    else  %б�ʴ��ڵ����
        y=tan(theta_x(i))*x_line+r(i)/cos(theta_x(i));
        plot(x_line,y,'r');  
    end  
end  