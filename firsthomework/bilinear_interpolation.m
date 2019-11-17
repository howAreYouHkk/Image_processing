function [new] = bilinear_interpolation()
% src 是原图像（s_h*s_w）,new 是目标图像（n_h*n_w）
% 缩放因子是s_h/n_h,s_w/n_w
% 双线性内插本质上就是从x 方向和y 方向分别作了一次线性插值
src = imread('test.jpg');
% 得到原图像的大小
[s_h,s_w,s_d] = size(src);
% 设置目标图像的大小是300*300*3
new = zeros(300,300,3);
[n_h,n_w,n_d] = size(new);
scaler_x = s_h/n_h;
scaler_y = s_w/n_w;
for i=1:n_h
    for j=1:n_w
        % 后向映射得到在原图上的大概坐标
        % 注意一般是浮点类型
        x = i*scaler_x;
        y = j*scaler_y;
        % 取得与(x,y)距离最近的4 个像素点
        x_l = floor(x);
        x_h = ceil(x);
        y_l = floor(y);
        y_h = ceil(x);
        p1_1 = src(x_l,y_l,:);
        p1_2 = src(x_l,y_h,:);
        p2_1 = src(x_h,y_l,:);
        p2_2 = src(x_h,y_h,:);
        % 先在x 轴方向进行二次线性内插
        fx1 = (x_h-x)/(x_h-x_l).*p1_1+(x-x_l)/(x_h-x_l).*p2_1;
        fx2 = (x_h-x)/(x_h-x_l).*p1_2+(x-x_l)/(x_h-x_l).*p2_2;
        % 在y 方向进行一次线性内插
        f = (y_h-y)/(y_h-y_l).*fx1+(y-y_l)/(y_h-y_l).*fx2;
        new(i,j,:) = f;
    end
    
end
new = uint8(new);
new = im2uint8(mat2gray(new));
figure();
imshow(src)
title('原图像')
figure();
imshow(new)
title('新图像')

        
    
end