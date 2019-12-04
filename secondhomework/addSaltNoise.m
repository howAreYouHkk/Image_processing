%使用imnoise函数添加噪声
function [noise_picture] =  addSaltNoise()
img = imread('test.jpg');
%添加椒盐噪声 ，密度为0.01
noise_picture = imnoise(img,'salt & pepper',0.01);
%subplot(1,2,1);
%imshow(img),title('原始图像');
%subplot(1,2,2);
%imshow(noise_picture),title('密度为0.05的椒盐噪声图像');

