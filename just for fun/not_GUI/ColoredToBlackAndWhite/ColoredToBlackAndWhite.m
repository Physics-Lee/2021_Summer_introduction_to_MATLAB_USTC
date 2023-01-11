A = imread('IMG_20181016_211642.jpg');
imshow(A);
for i=1:3
    figure(i+1); %打开3个新的窗口
    imshow(A(:,:,i)); %分别显示3列
end