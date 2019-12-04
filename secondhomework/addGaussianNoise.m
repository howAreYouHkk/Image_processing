%使用imnoise函数添加噪声
function [noise_picture] = addGaussianNoise()
img = imread('test.jpg');
%添加高斯噪声,均值为0，方差为0.01
noise_picture = imnoise(img,'gaussian',0,0.01);
%subplot(1,2,1);
%imshow(img),title('原始图像');
%subplot(1,2,2);
%imshow(noise_picture),title('均值为0，方差为0.01的高斯噪声图像');

