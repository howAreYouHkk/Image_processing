%滤波器大小为3*3，默认边界不处理，先处理椒盐噪声，在处理高斯噪声
function [] = HarmonicMeanFilter()
%处理椒盐噪声
salt_img=addSaltNoise();
[sa_h,sa_w,~]=size(salt_img);
new_salt=salt_img;
for i=2:sa_h-1
    for j=2:sa_w-1
        %获得3*3矩阵
        sa_temp=salt_img(i-1:i+1,j-1:j+1);
        new_salt(i,j,:)=9/(sum(sum(1./sa_temp)));
    end
end
figure('name','椒盐噪声');
subplot(1,2,1);
imshow(salt_img),title('椒盐噪声图像');
subplot(1,2,2);
imshow(new_salt),title('谐波均值处理后');

%处理高斯噪声
gau_img=addGaussianNoise();
[gau_h,gau_w,~]=size(gau_img);
new_gau=gau_img;
for i=2:gau_h-1
    for j=2:gau_w-1
        gau_temp=gau_img(i-1:i+1,j-1:j+1);
        new_gau(i,j,:)=9/(sum(sum(1./gau_temp)));
    end
end
figure('name','高斯噪声');
subplot(1,2,1);
imshow(gau_img),title('高斯噪声图像');
subplot(1,2,2);
imshow(new_gau),title('谐波均值处理后');
end
