%�˲�����СΪ3*3��Ĭ�ϱ߽粻�����ȴ������������ڴ����˹����
function [] = SelfAdaptingFilter()
%��˹����Ϊ0.01
gau_noise=0.01;
%�����˹����
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
figure('name','��˹����');
subplot(1,2,1);
imshow(gau_img),title('��˹����ͼ��');
subplot(1,2,2);
imshow(new_gau),title('����Ӧ�˲��������');
end