A=[0.2 0.4 ;0.8 0.6 ];
X0=[0;10^5];
x=zeros(1,11);%x用来存第一个城市的人口
y=zeros(1,length(x));%y用来存第二个城市的人口
for i=0:length(x)
    Y=popmove(A,X0,i,2);
    x(i+1)=Y(1);
    y(i+1)=Y(2);
end
plot(x,y,'black-o');%相空间中的图像

% 疑惑：
%     (x,y)收敛的速度也太快了吧。
%     而且无论初值差距多大，收敛速度都很快。
%     这背后的更深层次的数学原因是什么？