function [img] = generateFigure(imgW,imgH)
%������Ϊ����һ���Ĳ�ɫͼ��
%�ú�ɫ��ʾ[0,2*pi]�����Ҳ�
%����ɫ��ʾ[0,2*pi]�����Ҳ�
%����ɫ��ʾ[0,2*pi]��y=x^2ͼ��
x = 0:pi/8:2*pi;
r_y = sin(x);
g_y = cos(x);
b_y = x.^2;
plot(x,r_y,'r',x,g_y,'g',x,b_y,'b');
title('����ͼ��');
set(gcf,'position',[200,200,imgW,imgH])
img = gcf;
end

