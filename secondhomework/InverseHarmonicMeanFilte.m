%滤波器大小为3*3，默认边界不处理，先处理椒盐噪声，在处理高斯噪声
function [] = InverseHarmonicMeanFilte()
%阶数为1.5
q=1.5;
%处理椒盐噪声
salt_img=addSaltNoise();
salt_img=im2double(salt_img);
[sa_h,sa_w,~]=size(salt_img);
new_salt=salt_img;
for i=2:sa_h-1
    for j=2:sa_w-1
        %获得3*3矩阵
        sa_temp=salt_img(i-1:i+1,j-1:j+1);
        sa_temp1=sum(sum(sa_temp.^(q+1)));
        sa_temp2=sum(sum(sa_temp.^q));
        new_salt(i,j,:)=sa_temp1/sa_temp2;
    end
end
figure('name','椒盐噪声');
subplot(1,2,1);
imshow(salt_img),title('椒盐噪声图像');
subplot(1,2,2);
imshow(new_salt),title('逆谐波均值处理后');

%处理高斯噪声
gau_img=addGaussianNoise();
gau_img=im2double(gau_img);
[gau_h,gau_w,~]=size(gau_img);
new_gau=gau_img;
for i=2:gau_h-1
    for j=2:gau_w-1
        gau_temp=gau_img(i-1:i+1,j-1:j+1);
        gau_temp1=sum(sum(gau_temp.^(q+1)));
        gau_temp2=sum(sum(gau_temp.^q));
        new_gau(i,j,:)=gau_temp1/gau_temp2;
    end
end
figure('name','高斯噪声');
subplot(1,2,1);
imshow(gau_img),title('高斯噪声图像');
subplot(1,2,2);
imshow(new_gau),title('逆谐波均值处理后');
end

