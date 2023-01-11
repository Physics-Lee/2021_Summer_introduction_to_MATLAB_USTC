clc;clear;close all;

%画静态图
%画曲线
r=1;%r为小圆半径
k=1;%k为半径之比
R=k*r;%R为大圆半径
theta=0:0.01:2*pi*10;
x=(R+r)*cos(theta)-r*cos((R+r)/r*theta);
y=(R+r)*sin(theta)-r*sin((R+r)/r*theta);
plot(x,y);
axis equal tight;
hold on;%必须hold on
axis ((R+2*r)*[-1 1 -1 1]);
%画静圆
theta1=0:0.01:2*pi;
x1=R*cos(theta1);
y1=R*sin(theta1);
plot(x1,y1,'black');
hold on;

%画动态图
lyx = plot(x(1),y(1),'marker','o','markersize',5,'markerfacecolor','green');%造出一个圆
N = length(theta);
TimeInterval=20;%时间间隔 %时间间隔越大，转速越快
for i=1:TimeInterval:N
    set(lyx,'xdata',x(i),'ydata',y(i));
    %画动圆
    %(x0,y0)为动圆圆心的坐标
    x0=(R+r)*cos(theta(i));
    y0=(R+r)*sin(theta(i));
    %用参数方程画动圆
    theta2=0:0.01:2*pi;
    x2=r*cos(theta2)+x0;
    y2=r*sin(theta2)+y0;
    h2=plot(x2,y2);
    %连接小圆圆心和外摆线上的点
    h3=line([x0,x(i)],[y0,y(i)]);
    %制作gif
    F = getframe;%捕获当前图像作为1帧
%     im = frame2im(F);
%     [I,map] = rgb2ind(im,256);  
%     if i == 1
%         imwrite(I,map,'LyxIsTheCoolestBoyAllOverTheWorld.gif','GIF', 'Loopcount',inf,'DelayTime',10^(-10));
%     else
%         imwrite(I,map,'LyxIsTheCoolestBoyAllOverTheWorld.gif','GIF','WriteMode','append','DelayTime',10^(-10));
%     end      
    delete(h2);%删掉h2
    delete(h3);%删掉h3
    if i+TimeInterval>N %画最后一个图
        i=N;
        set(lyx,'xdata',x(i),'ydata',y(i));
        %画动圆
        %(x0,y0)为动圆圆心的坐标
        x0=(R+r)*cos(theta(i));
        y0=(R+r)*sin(theta(i));
        %用参数方程画动圆
        theta2=0:0.01:2*pi;
        x2=r*cos(theta2)+x0;
        y2=r*sin(theta2)+y0;
        h2=plot(x2,y2,'b');
        %连接动圆 圆心和外摆线上的点
        h3=line([x0,x(i)],[y0,y(i)]);
        %制作gif
        F = getframe;%捕获当前图像作为1帧
%         im = frame2im(F);
%         [I,map] = rgb2ind(im,256);  
%         if i == 1
%             imwrite(I,map,'LyxIsTheCoolestBoyAllOverTheWorld.gif','GIF', 'Loopcount',inf,'DelayTime',10^(-10));
%         else
%             imwrite(I,map,'LyxIsTheCoolestBoyAllOverTheWorld.gif','GIF','WriteMode','append','DelayTime',10^(-10));
%         end      
    end
end