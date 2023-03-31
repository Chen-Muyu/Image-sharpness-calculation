%Range
function X=Range(N1)
gray_level = 32; %灰度直方图中划分的灰度等级
temp=zeros(1,gray_level);
A = zeros(1,N1);
X = zeros(1,N1);
tic
for L=1: N1
    I=imread(strcat("D:/MSI-/MSI-/MATLAB/sharpness_test/image_data/",int2str(L),'.bmp')); %连续读取图片
    %I=double(I);   %-------没做数值类型，出错，曲线相反----------
    [count,K] = imhist(I,gray_level);%imhist()画灰度分布直方图,count表示某一灰度区间的像素个数，K表示灰度区间取值
    for y=1:gray_level
        temp(1,y)=count(y)*K(y);
    end
    A(1,L)=max(temp)-min(temp);
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