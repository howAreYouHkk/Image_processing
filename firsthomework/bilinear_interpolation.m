function [new] = bilinear_interpolation()
% src ��ԭͼ��s_h*s_w��,new ��Ŀ��ͼ��n_h*n_w��
% ����������s_h/n_h,s_w/n_w
% ˫�����ڲ屾���Ͼ��Ǵ�x �����y ����ֱ�����һ�����Բ�ֵ
src = imread('test.jpg');
% �õ�ԭͼ��Ĵ�С
[s_h,s_w,s_d] = size(src);
% ����Ŀ��ͼ��Ĵ�С��300*300*3
new = zeros(300,300,3);
[n_h,n_w,n_d] = size(new);
scaler_x = s_h/n_h;
scaler_y = s_w/n_w;
for i=1:n_h
    for j=1:n_w
        % ����ӳ��õ���ԭͼ�ϵĴ������
        % ע��һ���Ǹ�������
        x = i*scaler_x;
        y = j*scaler_y;
        % ȡ����(x,y)���������4 �����ص�
        x_l = floor(x);
        x_h = ceil(x);
        y_l = floor(y);
        y_h = ceil(x);
        p1_1 = src(x_l,y_l,:);
        p1_2 = src(x_l,y_h,:);
        p2_1 = src(x_h,y_l,:);
        p2_2 = src(x_h,y_h,:);
        % ����x �᷽����ж��������ڲ�
        fx1 = (x_h-x)/(x_h-x_l).*p1_1+(x-x_l)/(x_h-x_l).*p2_1;
        fx2 = (x_h-x)/(x_h-x_l).*p1_2+(x-x_l)/(x_h-x_l).*p2_2;
        % ��y �������һ�������ڲ�
        f = (y_h-y)/(y_h-y_l).*fx1+(y-y_l)/(y_h-y_l).*fx2;
        new(i,j,:) = f;
    end
    
end
new = uint8(new);
new = im2uint8(mat2gray(new));
figure();
imshow(src)
title('ԭͼ��')
figure();
imshow(new)
title('��ͼ��')

        
    
end