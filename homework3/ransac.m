%%%生成随机数据
x = normrnd(0,0.1,1,200);
y = x;
%生成outlier
tou1 = min(x)+rand(1,100)*(max(x)-min(x));  %生成x定义域内的outlier
x = [x, tou1];
tou2 = min(y)+rand(1,100)*(max(y)-min(y));  %生成y值域内的outlier
y = [y, tou2];
scatter(x,y); hold on;
data=[x',y'];
iter = 100; 

 %%% 绘制数据点

 number = size(data,2); % 总点数
 sigma = 1;
 pretotal=0;     %符合拟合模型的数据的个数

 for i=1:iter
 %%% 随机选择两个点
     idx = randperm(number,2); 
     sample = data(:,idx); 

     %%%拟合直线方程 y=kx+b
    
     x = sample(1, :);
     y = sample(2, :);

     k=(y(1)-y(2))/(x(1)-x(2));      %直线斜率
     b = y(1) - k*x(1);
     %k=(y(2)-x(2))/(y(1)-x(1));
     %b= x(2)-k*x(1);
     line = [k -1 b];

     mask=abs(line*[data; ones(1,size(data,2))]);    %求每个数据到拟合直线的距离
     total=sum(mask<sigma);              %计算数据距离直线小于一定阈值的数据的个数

     if total>pretotal            %找到符合拟合直线数据最多的拟合直线
         pretotal=total;
         bestline=line;          %找到最好的拟合直线
    end  
 end
 %显示符合最佳拟合的数据
mask=abs(bestline*[data; ones(1,size(data,2))])<sigma;    
hold on;
k=1;
for i=1:length(mask)
    if mask(i)
        inliers(1,k) = data(1,i);
        k=k+1;
    end
end

 %%% 绘制最佳匹配曲线
 bestParameter1 = -bestline(1)/bestline(2);
 bestParameter2 = -bestline(3)/bestline(2);
 xAxis = min(inliers(1,:)):max(inliers(1,:));
 yAxis = bestParameter1*xAxis + bestParameter2;
 plot(xAxis,yAxis,'r','LineWidth',2);
  title(['bestLine:  y =  ',num2str(bestParameter1),'x + ',num2str(bestParameter2)])