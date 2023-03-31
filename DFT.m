%DFT
function X=DFT(N1)
A = zeros(1,N1);  %A向量用来存储每一幅图像的清晰度原值
X = zeros(1,N1);  %X用来存储做归一化处理后的清晰度函数值
%----------------------
tic
for L=1: N1
    I=imread(strcat("D:/MSI-/MSI-/MATLAB/sharpness_test/image_data/",int2str(L),'.bmp')); %连续读取图片
    I=double(I);
    [M,N]=size(I);
    fftI = fft2(I);   %进行二维离散傅里叶变换
    sfftI = fftshift(fftI);   %移位，直流分量移到图像中心
    magnitude = abs(sfftI);      %取模值
    FI=0;
    for u=1:M
        for v=1:N
            FI=FI+sqrt(u*u+v*v)*magnitude(u,v);      %基于离散傅里叶变换的清晰度评价函数
        end
    end
    A(1,L) = FI/(M*N);
end
time=toc
%对原始数据做归一化处理，线性函数归一化公式
%-------------------------
for W = 1:N1
    C = max(A);
    D = min(A);
    E = C-D;
    R = (A(1,W) - D)/(E);
    X(1,W) = R;
end
end