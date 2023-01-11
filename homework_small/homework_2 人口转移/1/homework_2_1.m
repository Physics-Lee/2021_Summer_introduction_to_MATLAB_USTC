clc;clear;
A=zeros(10,10);%产生10*10的全0矩阵
for i=1:10
    for j=1:10
        A(i,j)=i+j;
    end
    j=0;
end