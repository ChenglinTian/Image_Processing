function []=HarmonicMeanFilter(filter_size)
img=imread('1.jpg');
[imgH,imgW]=size(img);
half_of_size=(filter_size-1)/2;
new_img=img;
for i=1+half_of_size:imgH-half_of_size
    for j=1+half_of_size:imgW-half_of_size
        img_temp=img(i-half_of_size:i+half_of_size,j-half_of_size:j+half_of_size);
        img_temp2=1./img_temp;
        new_img(i,j)=filter_size*filter_size/sum(img_temp2(:));
    end
end
imshow(new_img);
end