%滤波器大小为3*3，默认边界不处理，先处理椒盐噪声，在处理高斯噪声
function [] = SelfAdaptingFilter()
%高斯噪声为0.01
gau_noise=0.01;
%处理高斯噪声
gau_img=addGaussianNoise();
gau_img=im2double(gau_img);
[gau_h,gau_w,~]=size(gau_img);
new_gau=gau_img;
for i=2:gau_h-1
    for j=2:gau_w-1
        gau_temp=gau_img(i-1:i+1,j-1:j+1);
        temp=gau_temp(:);
        ML=mean(temp);
        gau_l=var(temp);
        gau_org=gau_img(i,j,:);
        new_gau(i,j,:)=gau_org-(gau_noise/gau_l)*(gau_org-ML);
    end
end
figure('name','高斯噪声');
subplot(1,2,1);
imshow(gau_img),title('高斯噪声图像');
subplot(1,2,2);
imshow(new_gau),title('自适应滤波器处理后');
end