function []=leastSquare()
% ���ݵ㼯�Ĵ�С
point_size = 100;
% ������˹�ֲ�����
x=normrnd(0,0.1,1,point_size);
% ԭ����Ϊy=x
y=x;
% outlier����
outlier_size=20;
% ����outlier
outlier_x=rand(1,outlier_size)*(max(x)-min(x))+min(x);
outlier_y=rand(1,outlier_size)*(max(x)-min(x))+min(x);
% �ϲ�����
x=[x outlier_x];
y=[y outlier_y];
scatter(x,y);hold on;
% ��С���˷���ϵ������
    a = x*x';
    b = sum(x);
    c = x*y';
    d = sum(y);
% ���б��k
k = (length(x).*c-b*d)./(length(x).*a-b*b)
% ���ؾ�t
t = (a.*d-c.*b)/(a*length(x)-b.*b)
y2=x*k+t;
plot(x,y2,'r');
title(['��С���˷����ֱ��Ϊ:  y =  ',num2str(k),'x + ',num2str(t)]);