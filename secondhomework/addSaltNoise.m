%ʹ��imnoise�����������
function [noise_picture] =  addSaltNoise()
img = imread('test.jpg');
%��ӽ������� ���ܶ�Ϊ0.01
noise_picture = imnoise(img,'salt & pepper',0.01);
%subplot(1,2,1);
%imshow(img),title('ԭʼͼ��');
%subplot(1,2,2);
%imshow(noise_picture),title('�ܶ�Ϊ0.05�Ľ�������ͼ��');

