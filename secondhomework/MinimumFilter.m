%�˲�����СΪ3*3��Ĭ�ϱ߽粻�����ȴ������������ڴ����˹����
function [] = MinimumFilter()
%����������
salt_img=addSaltNoise();
salt_img=im2double(salt_img);
[sa_h,sa_w,~]=size(salt_img);
new_salt=salt_img;
for i=2:sa_h-1
    for j=2:sa_w-1
        %���3*3����
        sa_temp=salt_img(i-1:i+1,j-1:j+1);
        new_salt(i,j,:)=min(sa_temp(:));
    end
end
figure('name','��������');
subplot(1,2,1);
imshow(salt_img),title('��������ͼ��');
subplot(1,2,2);
imshow(new_salt),title('��Сֵ�˲��������');

%�����˹����
gau_img=addGaussianNoise();
gau_img=im2double(gau_img);
[gau_h,gau_w,~]=size(gau_img);
new_gau=gau_img;
for i=2:gau_h-1
    for j=2:gau_w-1
        gau_temp=gau_img(i-1:i+1,j-1:j+1);
        new_gau(i,j,:)=min(gau_temp(:));
    end
end
figure('name','��˹����');
subplot(1,2,1);
imshow(gau_img),title('��˹����ͼ��');
subplot(1,2,2);
imshow(new_gau),title('��Сֵ�˲��������');
end
