function []=leastSquare()
% 数据点集的大小
point_size = 100;
% 产生高斯分布数据
x=normrnd(0,0.1,1,point_size);
% 原曲线为y=x
y=x;
% outlier数量
outlier_size=20;
% 产生outlier
outlier_x=rand(1,outlier_size)*(max(x)-min(x))+min(x);
outlier_y=rand(1,outlier_size)*(max(x)-min(x))+min(x);
% 合并数据
x=[x outlier_x];
y=[y outlier_y];
scatter(x,y);hold on;
% 最小二乘法的系数设置
    a = x*x';
    b = sum(x);
    c = x*y';
    d = sum(y);
% 求解斜率k
k = (length(x).*c-b*d)./(length(x).*a-b*b)
% 求解截距t
t = (a.*d-c.*b)/(a*length(x)-b.*b)
y2=x*k+t;
plot(x,y2,'r');
title(['最小二乘法拟合直线为:  y =  ',num2str(k),'x + ',num2str(t)]);