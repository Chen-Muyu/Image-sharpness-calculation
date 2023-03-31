%EOG(Energy Of Grad)
function X=EOG(N1)
A = zeros(1,N1);  %存储每一幅图像清晰度评价值
X = zeros(1,N1);  %存储做归一化处理后的评价值
tic     %计时
for L=1: N1
    I=imread(strcat("D:/MSI-/MSI-/MATLAB/sharpness_test/image_data/",int2str(L),'.bmp')); %连续读取图片
    I=double(I);
    [M,N]=size(I);
    FI=0;

    for x=1:M-1
        for y=1:N-1
            % x方向和y方向的相邻像素灰度值只差的的平方和作为清晰度值
            FI=FI+(I(x+1,y)-I(x,y))*(I(x+1,y)-I(x,y))+(I(x,y+1)-I(x,y))*(I(x,y+1)-I(x,y));
        end
    end

    A(1,L) = FI;
end
time=toc
%--------------------------------
%对图像清晰度值做归一化处理，线性函数归一化公式
for W = 1:N1
    C = max(A);
    D = min(A);
    E = C-D;
    R = (A(1,W) - D)/(E);
    X(1,W) = R;
end
%绘图
%plot(1:W,X);
end