%Roberts

function X=Roberts(N1)
A = zeros(1,N1);
X = zeros(1,N1);
tic
for L=1: N1
    I=imread(strcat("D:/MSI-/MSI-/MATLAB/sharpness_test/image_data/",int2str(L),'.bmp'));
    I=double(I);
    [M,N]=size(I);
    FI=0;
    %Robert算子原理，对角方向相邻的两像素之差
    for x=1:M-1
        for y=1:N-1
            FI= FI + (abs(I(x,y)-I(x+1,y+1))+abs(I(x+1,y)-I(x,y+1)));
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
