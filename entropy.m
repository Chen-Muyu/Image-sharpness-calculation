%entropy
function X=entropy(N1)
A = zeros(1,N1);   %zeros()定义指定行列的零矩阵；A矩阵用来存储每一幅图像的清晰度原值
X = zeros(1,N1);   %X用来存储做归一化处理后的函数值
%处理图片
tic
for L=1: N1
    I=imread(strcat("D:/MSI-/MSI-/MATLAB/sharpness_test/image_data/",int2str(L),'.bmp')); %连续读取图片
    I=double(I);
    A(1,L)=entr(I);    %调用求熵值函数
end
time=toc
%对原始数据做归一化处理，线性函数归一化公式
for W = 1:N1
    C = max(A);
    D = min(A);
    E = C-D;
    R = (A(1,W) - D)/(E);
    X(1,W) = R;
end
end
%定义子函数entr()，求一幅图像的熵值
%-------------------------------------------
function[H_img]= entr(I)
[C,R]=size(I); %求图像的规格
Img_size=C*R; %图像像素点的总个数
L=256; %图像的灰度级0-255
H_img=0;  %图象熵
nk=zeros(L,1); %存储图像灰度出现次数
for i=1:C
    for j=1:R
        Img_level=I(i,j)+1; %获取图像的灰度级
        nk(Img_level)=nk(Img_level)+1; %统计每个灰度级像素的点数
    end
end
for k=1:L
    Ps(k)=nk(k)/Img_size; %计算每一个灰度级像素点所占的概率
    if Ps(k)~=0 %去掉概率为0的像素点
        H_img=-Ps(k)*log2(Ps(k))+H_img; %求熵值的公式
    end
end
end