%ʹ��imnoise�����������
function [noise_picture] = addGaussianNoise()
img = imread('test.jpg');
%��Ӹ�˹����,��ֵΪ0������Ϊ0.01
noise_picture = imnoise(img,'gaussian',0,0.01);
%subplot(1,2,1);
%imshow(img),title('ԭʼͼ��');
%subplot(1,2,2);
%imshow(noise_picture),title('��ֵΪ0������Ϊ0.01�ĸ�˹����ͼ��');

