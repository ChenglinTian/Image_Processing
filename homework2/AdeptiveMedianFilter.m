function []=AdeptiveMedianFilter(filter_size)
img=imread('1.jpg');
[imgH,imgW]=size(img);
half_of_size=(filter_size-1)/2;
new_img=img;
for i=1+half_of_size:imgH-half_of_size
    for j=1+half_of_size:imgW-half_of_size
        window_size=1;
        while window_size<=half_of_size
            img_temp=img(i-window_size:i+window_size,j-window_size:j+window_size); 
            img_temp1=sort(img_temp(:));
            if mod(window_size,2)==0
                 Zmed=img_temp1((window_size*window_size)/2+1);
            else
                Zmed=img_temp1((window_size*window_size)/2+0.5);
            end
            Zmin=img_temp1(1);
            Zmax=img_temp1(window_size*window_size);
            A1=Zmed-Zmin;
            A2=Zmed-Zmax;
            if A1>0 && A2<0
                break;
            else
                window_size=window_size+1;
            end
        end
        if window_size>filter_size
            new_img(i.j)=img(i,j);
        else
            B1=img(i,j)-Zmin;
            B2=img(i,j)-Zmax;
            if B1>0 && B2<0
                new_img(i,j)=img(i,j);
            else
                new_img(i,j)=Zmed;
            end
        end
            
        
    end
end
imshow(new_img);
end