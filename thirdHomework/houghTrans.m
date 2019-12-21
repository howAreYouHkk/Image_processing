function []=houghTrans()
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
data=[x;y];  
number=point_size+outlier_size; 
% 霍夫空间  
n_max=5;
h=zeros(315,2*n_max);  
theta_i=1;  
% 拟合阈值 
sigma=80; 
for theta=0:0.01:3.14  
    p=[-sin(theta),cos(theta)];  
    d=p*data;  
    for i=1:number  
   %由于霍夫空间中d比较大，对d值进行了缩放  
    h(theta_i,round(d(i)/10+n_max))=h(theta_i,round(d(i)/10+n_max))+1;  
    end  
    theta_i=theta_i+1;  
end  
[tx,p]=find(h>sigma);
% 符合直线条数  
lines=size(tx);
% 将还原回距离R  
r=(p-n_max)*10;
% 将theta还原  
tx=0.01*tx;
x=min(data(:)):0.05:max(data(:));  
% 画出拟合曲线  
    for i=1:40:lines  
        y = tan(tx(i))*x+r(i)/cos(tx(i));
        plot(x,y,'r');  
    end
end
