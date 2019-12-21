function []=houghTrans()
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
data=[x;y];  
number=point_size+outlier_size; 
% ����ռ�  
n_max=5;
h=zeros(315,2*n_max);  
theta_i=1;  
% �����ֵ 
sigma=80; 
for theta=0:0.01:3.14  
    p=[-sin(theta),cos(theta)];  
    d=p*data;  
    for i=1:number  
   %���ڻ���ռ���d�Ƚϴ󣬶�dֵ����������  
    h(theta_i,round(d(i)/10+n_max))=h(theta_i,round(d(i)/10+n_max))+1;  
    end  
    theta_i=theta_i+1;  
end  
[tx,p]=find(h>sigma);
% ����ֱ������  
lines=size(tx);
% ����ԭ�ؾ���R  
r=(p-n_max)*10;
% ��theta��ԭ  
tx=0.01*tx;
x=min(data(:)):0.05:max(data(:));  
% �����������  
    for i=1:40:lines  
        y = tan(tx(i))*x+r(i)/cos(tx(i));
        plot(x,y,'r');  
    end
end
