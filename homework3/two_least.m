y=normrnd(0,1,[1,30]);
x=y+3;
%向直线中添加随机噪声
y=y+wgn(1,30,0);
x=x+wgn(1,30,0);
%y1=y+rand(1,50);
%x1=y+rand(1,50);
%x=[x x1];
%y=[y y1];
%scatter(x,y);hold on;
%计算最小二乘的各个系数
A = x*x';
B = sum(x);
C = x*y';
D = sum(y);
n=length(x)
a= (n*C-B*D)./(n*A-B*B);
b= (A*D-C*B)/(A*n-B*B);
y=x*a+b;
plot(x,y,'r');