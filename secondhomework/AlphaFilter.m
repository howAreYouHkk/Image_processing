%�˲�����СΪ3*3��Ĭ�ϱ߽粻�����ȴ������������ڴ����˹����
function [] = AlphaFilter()
%�趨d=3
d=3;
d_max=floor(d/2);
d_min=ceil(d/2);
%����������
salt_img=addSaltNoise();
salt_img=im2double(salt_img);
[sa_h,sa_w,~]=size(salt_img);
new_salt=salt_img;
for i=2:sa_h-1
    for j=2:sa_w-1
        %���3*3����
        sa_temp=salt_img(i-1:i+1,j-1:j+1);
        temp1=sort(sa_temp(:));
        temp2=temp1(1+d_min:9-d_max);
        new_salt(i,j,:)=sum(temp2)/(9-d);
    end
end
figure('name','��������');
subplot(1,2,1);
imshow(salt_img),title('��������ͼ��');
subplot(1,2,2);
imshow(new_salt),title('alpha�˲��������');

%�����˹����
gau_img=addGaussianNoise();
gau_img=im2double(gau_img);
[gau_h,gau_w,~]=size(gau_img);
new_gau=gau_img;
for i=2:gau_h-1
    for j=2:gau_w-1
        gau_temp=gau_img(i-1:i+1,j-1:j+1);
        temp1=sort(gau_temp(:));
        temp2=temp1(1+d_min:9-d_max);
        new_gau(i,j,:)=sum(temp2)/(9-d);
    end
end
figure('name','��˹����');
subplot(1,2,1);
imshow(gau_img),title('��˹����ͼ��');
subplot(1,2,2);
imshow(new_gau),title('alpha�˲��������');
end
