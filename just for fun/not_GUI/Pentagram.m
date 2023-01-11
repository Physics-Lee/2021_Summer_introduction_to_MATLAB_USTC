clc;clear;
r1=10;
r2=r1*sin(126*pi/180)/sin(18*pi/180);%五角星中，只需给定小圆半径r1，整个五角星都确定 %即，r1相等的五角星是全等五角星
theta=zeros(1,11);
r=zeros(1,11);%plot函数用11个点连10条线
for i=1:11
    if mod(i,2)==1 
        theta(i)=(18+72*((i-1)/2))*pi/180;%如果i是奇数，18°
        r(i)=r2;%如果i是奇数，五角星中较远的五个点
    end
    if mod(i,2)==0 
        theta(i)=(54+72*((i-2)/2))*pi/180;%如果i是偶数，54°
        r(i)=r1;%如果i是奇数，五角星中较近的五个点
    end
end
z=r.*exp(1i*theta);
plot(z);
axis tight 
axis equal;
hold on;
plot(0,0,'black-o','MarkerSize',1);
gtext('ct');