function[Y,N]=popmove(P,X0,N, method)
fprintf('您好，这个程序可以帮您计算人口转移\n');
fprintf('我们设计的函数的输入为(P,X0,N, method)的形式。P为方阵，代表人口转移矩阵。 X0:为列向量，代表初始各城市人口数量。N为标量，代表迭代次数。method=1，用𝑋𝑘+1 = 𝑃𝑋𝑘；method=2，用特征值\n');
fprintf('我们设计的函数的输出为[Y,N]的形式。Y为列向量，代表N年后各城市人口数量。N为标量，代表迭代年份。\n');

%判断是否为人口转移矩阵

[P_RowNumber,P_ColumnNumber]=size(P);%a为P的行数，b为P的列数
%判断P是否为方阵
if P_RowNumber~=P_ColumnNumber
    fprintf('您输入的不是方阵\n');
    return
end
%判断Pij是否都＞0
for i=1:P_RowNumber
    for j=1:P_ColumnNumber
        if P(i,j)<0
            fprintf('您输入的矩阵中，存在小于0的元素\n');
            return
        end
    end
end
%判断P的列和是否都=1
P_SumOfColumn=sum(P);%c为行向量，c的元素是P的列和
for i=1:P_ColumnNumber
    if P_SumOfColumn(i)~=1
       fprintf('您输入的矩阵中，存在列和不为1的列\n');
       return
    end
end
fprintf('经过检查，您输入的是人口转移矩阵\n');

%若用户没输入N，默认N=10；

if nargin<=2
    N=10;
    fprintf('您没有给出迭代次数，我们默认N=10\n');
else
    fprintf('您指定的N=%d\n',N);
end

%若用户没输入method 默认用method=1

if nargin<=3
    method=1;
    fprintf('您没有指定method，我们默认用𝑋𝑘+1 = 𝑃𝑋的方法\n');
end
if method==1
    Y=Y1(P,X0,N);
    fprintf('您指定method为1，我们用𝑋𝑘+1 = 𝑃𝑋的方法\n');
end
if method==2
    Y=Y2(P,X0,N);
    fprintf('您指定method为2，我们用特征值的方法\n');
end

%两个方法

%方法一 𝑋𝑘+1 = 𝑃𝑋
    function result1=Y1(P,X0,N)
        result1=P^N*X0;
    end
%方法二 特征值
    function result2=Y2(P,X0,N)
        [V,D]=eig(P);%D的对角元为特征值，V的列为特征向量 %易知A*V=V*D
        c=V^(-1)*X0;%c为列向量，其元素为把X0用特征向量表示的系数 %即c是X0在特征向量组成的一组基下的系数
        result2=0;%把result2初值置0
        for k=1:P_ColumnNumber
            result2=result2+c(k)*D(k,k)^N*V(:,k);%此法可以也用来解斐波那契数列 %可参考Wikipedia上的Fibonacci sequence
        end
    end
fprintf('程序运行结束了，快去看看结果吧！\n\n\n');
end