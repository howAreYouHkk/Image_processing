function []=houImg()
img=imread('test.jpg');
%  ������˹����
filter=[0,1,0;1,-4,1;0,1,0];
% ���Ӵ�С
fsize=3;
flength = (fsize-1)/2;
% ͼ��Ҷ�ת��
bwImg = double (rgb2gray(img));
[imgH,imgW]=size(bwImg);
id=1;
imshow(bwImg);
% ����ͼ�񣬽��������gNewImg
for i=1+flength:imgH-flength
    for j=1+flength:imgW-flength
            temp = bwImg(i-flength:i+flength,j-flength:j+flength);
            newImg(i,j)=sum(sum(temp.*filter));
%             ��¼��Ե������
            if newImg(i,j) ~= 0 
                x(id)=i;
                y(id)=j;
                id=id+1;
            end
    end
end
imshow(newImg);
% figure;
% scatter(x,y);
hold on;
data=[x;y];  
number=size(data,2); 
% ����ռ�  
n_max=65;
h=zeros(315,2*n_max);  
ti=1;  
% �����ֵ 
ma=80; 
for theta=0:0.01:3.14  
    p=[-sin(theta),cos(theta)];  
    d=p*data;  
    for i=1:number  
   %���ڻ���ռ���d�Ƚϴ󣬶�dֵ����������  
    h(ti,round(d(i)/10+n_max))=h(ti,round(d(i)/10+n_max))+1;  
    end  
    ti=ti+1;  
end  
[tx,p]=find(h>ma);
% ����ֱ������  
lines=size(tx);
% ����ԭ�ؾ���R  
r=(p-n_max)*10;
% ��theta��ԭ  
tx=0.01*tx;
x=min(data(:)):20:max(data(:));  
% �����������  
    for i=1:80:lines  
        y = tan(tx(i))*x+r(i)/cos(tx(i));
        if max(y)<160 && min(y)>0
          plot(x,y,'r');  
        end
    end
end
