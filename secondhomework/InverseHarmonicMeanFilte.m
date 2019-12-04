%�˲�����СΪ3*3��Ĭ�ϱ߽粻�����ȴ������������ڴ����˹����
function [] = InverseHarmonicMeanFilte()
%����Ϊ1.5
q=1.5;
%����������
salt_img=addSaltNoise();
salt_img=im2double(salt_img);
[sa_h,sa_w,~]=size(salt_img);
new_salt=salt_img;
for i=2:sa_h-1
    for j=2:sa_w-1
        %���3*3����
        sa_temp=salt_img(i-1:i+1,j-1:j+1);
        sa_temp1=sum(sum(sa_temp.^(q+1)));
        sa_temp2=sum(sum(sa_temp.^q));
        new_salt(i,j,:)=sa_temp1/sa_temp2;
    end
end
figure('name','��������');
subplot(1,2,1);
imshow(salt_img),title('��������ͼ��');
subplot(1,2,2);
imshow(new_salt),title('��г����ֵ�����');

%�����˹����
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
figure('name','��˹����');
subplot(1,2,1);
imshow(gau_img),title('��˹����ͼ��');
subplot(1,2,2);
imshow(new_gau),title('��г����ֵ�����');
end

