clc;clear;close all;

%给出全局变量的值
global sigma rou beta;
sigma=10;
rou=28;
beta=8/3;

%用ode45求解ODE
B0=[10 10 10];%初值
tspan=[0,100];%求解区间
[t,A]=ode45(@homework_6,tspan,B0);

%画图
plot(t,A(:,1),'red');
hold on;
plot(t,A(:,2),'blue');
plot(t,A(:,3),'black');
legend('x','y','z');

figure(2);
% plot3(A(:,1),A(:,2),A(:,3));
x=A(:,1);
y=A(:,2);
z=A(:,3);
% view([1,10,1]);
view([1,0,0]);
hold on;
%画动态图
lyx = plot3(x(1),y(1),z(1),'marker','o','markersize',5,'markerfacecolor','green');%造出一个圆
N = length(x);
TimeInterval=1;%时间间隔 %时间间隔越大，转速越快
for i=1:TimeInterval:N
    set(lyx,'xdata',x(i),'ydata',y(xi),'zdata',z(i));
    if i>=2
        h3=line([x(i-1),x(i)],[y(i-1),y(i)],[z(i-1),z(i)]);
    end
    %制作gif
    F = getframe;%捕获当前图像作为1帧
    im = frame2im(F);
    [I,map] = rgb2ind(im,256);  
    if i == 1
        imwrite(I,map,'LyxIsTheCoolestBoyAllOverTheWorld.gif','GIF', 'Loopcount',inf,'DelayTime',10^(-10));
    else
        imwrite(I,map,'LyxIsTheCoolestBoyAllOverTheWorld.gif','GIF','WriteMode','append','DelayTime',10^(-10));
    end      
end

% figure(3);
% subplot(2,2,1);
% plot(A(:,1),A(:,2));
% subplot(2,2,2);
% plot(A(:,1),A(:,3));
% subplot(2,2,3);
% plot(A(:,2),A(:,3));
