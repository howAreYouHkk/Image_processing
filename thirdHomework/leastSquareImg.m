function [] = leastSquareImg()
img=imread('test.jpg ');
%  ������˹����
filter=[0,1,0;1,-4,1;0,1,0];
% ���Ӵ�С
fsize=3;
flength = (fsize-1)/2;
% ͼ��Ҷ�ת��
bwImg = double (rgb2gray(img));
[imgH,imgW]=size(bwImg);
p=1;
imshow(bwImg);
% ����ͼ�񣬽��������gNewImg
for i=1+flength:imgH-flength
    for j=1+flength:imgW-flength
            temp = bwImg(i-flength:i+flength,j-flength:j+flength);
            newImg(i,j)=sum(sum(temp.*filter));
%             ��¼��Ե������
            if newImg(i,j) ~= 0 
                x(p)=i;
                y(p)=j;
                p=p+1;
            end
    end
end
imshow(newImg);
% scatter(x,y);
hold on;

for i=20:20:400
    x1=x(:,i-19:i);
    y1=y(:,i-19:i);
    % ��С���˷���ϵ������
    a = x1*x1';
    b = sum(x1);
    c = x1*y1';
    d = sum(y1);
    % ���б��k
    k = (length(x1).*c-b*d)./(length(x1).*a-b*b);
    % ���ؾ�t
    t = (a.*d-c.*b)/(a*length(x1)-b.*b);
    y1=x1*k+t;
    plot(x1,y1,'r');
end