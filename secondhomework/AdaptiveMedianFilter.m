function [] = AdaptiveMedianFilter()
%�趨Smax=7
Smax=7;
%������������
salt_img=addSaltNoise();
salt_img=im2double(salt_img);
[sa_h,sa_w,~]=size(salt_img);
new_salt=salt_img;
for i=4:sa_h-3
    for j=4:sa_w-3
        r=1;
        sa_Zxy=salt_img(i,j,:);
        while(r<=Smax)
            sa_temp=salt_img(i-r:i+r,j-r:j+r);
            sa_Zmin=min(sa_temp(:));
            sa_Zmax=max(sa_temp(:));
            sa_Zmed=median(sa_temp(:));
            if(sa_Zmed>sa_Zmin&&sa_Zmed<sa_Zmax)
                break;
            else 
                r=r+1;
            end
        end
        if(sa_Zxy>sa_Zmin&&sa_Zxy<sa_Zmax)
            new_salt(i,j,:)=sa_Zxy;
        else
            new_salt(i,j,:)=sa_Zmed;
        end
    end
end
figure('name','��������');
subplot(1,2,1);
imshow(salt_img),title('��������ͼ��');
subplot(1,2,2);
imshow(new_salt),title('����Ӧ��ֵ�˲���������');

%������˹����
gau_img=addGaussianNoise();
gau_img=im2double(gau_img);
[gau_h,gau_w,~]=size(gau_img);
new_gau=gau_img;
for i=4:gau_h-3
    for j=4:gau_w-3
        r=1;
        gau_Zxy=salt_img(i,j,:);
        while(r<=Smax)
            gau_temp=gau_img(i-r:i+r,j-r:j+r);
            gau_Zmin=min(gau_temp(:));
            gau_Zmax=max(gau_temp(:));
            gau_Zmed=median(gau_temp(:));
            if(gau_Zmed>gau_Zmin&&gau_Zmed<gau_Zmax)
                break;
            else 
                r=r+1;
            end
        end
        if(gau_Zxy>gau_Zmin&&gau_Zxy<gau_Zmax)
            new_gau(i,j,:)=gau_Zxy;
        else
            new_gau(i,j,:)=gau_Zmed;
        end
    end
end
figure('name','��˹����');
subplot(1,2,1);
imshow(gau_img),title('��˹����ͼ��');
subplot(1,2,2);
imshow(new_gau),title('����Ӧ��ֵ�˲���������');
end