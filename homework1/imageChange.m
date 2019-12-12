function [img]=generateFigure(imgW,imgH)
%创建一个长宽为规定长宽的白色图像
   A=255*ones(imgH,imgW,3);
   %set(0,'defaultfigurecolor','w');
   A=uint8(A);
   A(:,1,:)=0;
   a=round(imgH/2);
   A(a,:,:)=0;
   x=0:2*pi/imgW:2*pi;
   y1=sin(x);
   y2=cos(x);
   y3=x.^2;
   y4=(-0.5)*x+pi;
   y5=0.5*x-pi;
   y6=(-2)*x+2;
   x=int32(x*imgW/(2*pi));
   y1=int32(imgH/2-y1*imgH/4);
   y2=int32(imgH/2-y2*imgH/4);
   y3=int32(imgH/2-y3*imgH/4);
   y4=int32(imgH/2-y4*imgH/4);
   y5=int32(imgH/2-y5*imgH/4);
   y6=int32(imgH/2-y6*imgH/4);
   for i=1:imgW
       if x(i)==0
          continue;
       end;
       
       if  y1(i)<=imgH
           A(y1(i),x(i),2)=0;
           A(y1(i),x(i),3)=0;
       end;
       if  y2(i)<=imgH
           A(y2(i),x(i),1)=0;
           A(y2(i),x(i),3)=0;
       end;
       if  y3(i)>0 && y3(i)<=imgH
           A(y3(i),x(i),1)=0;
           A(y3(i),x(i),2)=0;
       end;
       sb=fix(i/5);
       if rem(sb,2)==0
            A(round(imgH*3/4),x(i),:)=0;
            A(round(imgH*1/4),x(i),:)=0;
       end;
       if i>=round(0.96*imgW)
           A(y4(i),x(i),:)=0;
           A(y5(i),x(i),:)=0;
       end;
       if i<=round(0.02*imgW)
           A(y6(i),x(i),:)=0;
       end;
       if i==round(imgW/4) | i==round(imgW*3/4)
           for t=1:10
               A(imgH/2-t,x(i),:)=0;
           end
       end;
   end;
   imshow(A);
end