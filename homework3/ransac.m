%%%�����������
x = normrnd(0,0.1,1,200);
y = x;
%����outlier
tou1 = min(x)+rand(1,100)*(max(x)-min(x));  %����x�������ڵ�outlier
x = [x, tou1];
tou2 = min(y)+rand(1,100)*(max(y)-min(y));  %����yֵ���ڵ�outlier
y = [y, tou2];
scatter(x,y); hold on;
data=[x',y'];
iter = 100; 

 %%% �������ݵ�

 number = size(data,2); % �ܵ���
 sigma = 1;
 pretotal=0;     %�������ģ�͵����ݵĸ���

 for i=1:iter
 %%% ���ѡ��������
     idx = randperm(number,2); 
     sample = data(:,idx); 

     %%%���ֱ�߷��� y=kx+b
    
     x = sample(1, :);
     y = sample(2, :);

     k=(y(1)-y(2))/(x(1)-x(2));      %ֱ��б��
     b = y(1) - k*x(1);
     %k=(y(2)-x(2))/(y(1)-x(1));
     %b= x(2)-k*x(1);
     line = [k -1 b];

     mask=abs(line*[data; ones(1,size(data,2))]);    %��ÿ�����ݵ����ֱ�ߵľ���
     total=sum(mask<sigma);              %�������ݾ���ֱ��С��һ����ֵ�����ݵĸ���

     if total>pretotal            %�ҵ��������ֱ�������������ֱ��
         pretotal=total;
         bestline=line;          %�ҵ���õ����ֱ��
    end  
 end
 %��ʾ���������ϵ�����
mask=abs(bestline*[data; ones(1,size(data,2))])<sigma;    
hold on;
k=1;
for i=1:length(mask)
    if mask(i)
        inliers(1,k) = data(1,i);
        k=k+1;
    end
end

 %%% �������ƥ������
 bestParameter1 = -bestline(1)/bestline(2);
 bestParameter2 = -bestline(3)/bestline(2);
 xAxis = min(inliers(1,:)):max(inliers(1,:));
 yAxis = bestParameter1*xAxis + bestParameter2;
 plot(xAxis,yAxis,'r','LineWidth',2);
  title(['bestLine:  y =  ',num2str(bestParameter1),'x + ',num2str(bestParameter2)])