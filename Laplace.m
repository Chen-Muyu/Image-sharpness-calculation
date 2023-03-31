%Laplace
function X=Laplace(N1)
A = zeros(1,N1);
X = zeros(1,N1);
tic
for L=1: N1
    I=imread(strcat("D:/MSI-/MSI-/MATLAB/sharpness_test/image_data/",int2str(L),'.bmp')); %连续读取图片
    I=double(I);
    [M,N]=size(I);
    FI=0;
    for x=2:M-1
        for y=2:N-1
            IXXIYY = -4*I(x,y)+I(x,y+1)+I(x,y-1)+I(x+1,y)+I(x-1,y);
            FI=FI+IXXIYY*IXXIYY;        %取各像素点梯度的平方和作为清晰度值
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