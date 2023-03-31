%vollaths
function X=vollaths(N1)
%N1为要处理的图片张数
A = zeros(1,N1);   %zeros()定义指定行列的零矩阵；A矩阵用来存储每一幅图像的清晰度原值
X = zeros(1,N1);   %X用来存储做归一化处理后的函数值
%用一个for循环处理每一张图片
tic
for L=1: N1
    I=imread(strcat("D:/MSI-/MSI-/MATLAB/sharpness_test/image_data/",int2str(L),'.bmp')); %连续读取图片
    I=double(I);        %精度存储问题
    [M,N]=size(I);     %M等于矩阵行数，N等于矩阵列数；size()获取矩阵行列数
    %begintime=clock;
    
    FI=0;        %变量，暂时存储每一幅图像的Brenner值
    for x=1:M-2      %Brenner函数原理，计算相差两个位置的像素点的灰度值
        for y=1:N
            FI=FI+I(x,y)*abs(I(x+1,y)-I(x+2,y));
        end
    end
    %time=etime(clock,begintime);
    A(1,L) = FI;
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