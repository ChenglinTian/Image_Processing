function []=AlphaMeanFilter(filter_size,D)
img=imread('1.jpg');
[imgH,imgW]=size(img);
half_of_size=(filter_size-1)/2;
new_img=img;
for i=1+half_of_size:imgH-half_of_size
    for j=1+half_of_size:imgW-half_of_size
        img_temp=img(i-half_of_size:i+half_of_size,j-half_of_size:j+half_of_size);
        img_temp2=sort(img_temp(:));
        if mod(D,2)==0
            D1=D/2;
            D2=D/2;
        else 
            D1=D/2-0.5;
            D2=D/2+0.5;
        end
        img_temp3=img_temp2(D1+1:filter_size*filter_size-D2);
        new_img(i,j)=sum(img_temp3(:))/(filter_size*filter_size-D);;
    end
end
imshow(new_img);
end