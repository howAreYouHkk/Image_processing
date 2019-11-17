function [img] = generateFigure(imgW,imgH)
%其作用为产生一幅的彩色图像
%用红色显示[0,2*pi]的正弦波
%用绿色显示[0,2*pi]的余弦波
%用蓝色显示[0,2*pi]的y=x^2图像
x = 0:pi/8:2*pi;
r_y = sin(x);
g_y = cos(x);
b_y = x.^2;
plot(x,r_y,'r',x,g_y,'g',x,b_y,'b');
title('函数图像');
set(gcf,'position',[200,200,imgW,imgH])
img = gcf;
end

