%Variance
function X=Variance(N1)
A = zeros(1,N1);
X = zeros(1,N1);
tic
for L=1: N1
    I=imread(strcat("D:/MSI-/MSI-/MATLAB/sharpness_test/image_data/",int2str(L),'.bmp')); %连续读取图片
    I=double(I);
    [M,N]=size(I);
    gama = 0;   %gama图像平均灰度值
    %求gama
    for x=1:M
        for y=1:N
            gama = gama + I(x,y);
        end
    end
    gama = gama/(M*N);

    FI=0;
    for x=1:M
        for y=1:N
            FI=FI+(I(x,y)-gama)*(I(x,y)-gama);
        end
    end
    A(1,L) = FI;
end
time=toc
for W = 1:N1
    C = max(A);
    D = min(A);
    E = C-D;
    R = (A(1,W) - D)/(E);
    X(1,W) = R;
end
end