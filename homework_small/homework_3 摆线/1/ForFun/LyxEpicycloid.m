clc;clear;close all;

%画静态图
r=1;%r为小圆半径
k=1;%k为半径之比
R=k*r;%R为大圆半径
theta=2*pi:-0.01:0;
x=(R+r)*cos(theta)-r*cos((R+r)/r*theta);
y=(R+r)*sin(theta)-r*sin((R+r)/r*theta);
plot(y,x);
axis equal tight;
hold on;%必须hold on


%画动态图
lyx = plot(y(1),x(1),'marker','o','markersize',10,'markerfacecolor','r');%造出一个圆
N = length(x);
TimeInterval=20;%时间间隔
for k=1:TimeInterval:N
  set(lyx,'xdata',y(k),'ydata',x(k));
  F = getframe;%捕获当前图像作为1帧
  im = frame2im(F);
  [I,map] = rgb2ind(im,256);  
  if k == 1
      imwrite(I,map,'LyxIsTheCoolestBoyAllOverTheWorld.gif','GIF', 'Loopcount',inf,'DelayTime',0.0001);
  else
      imwrite(I,map,'LyxIsTheCoolestBoyAllOverTheWorld.gif','GIF','WriteMode','append','DelayTime',0.0001);
  end      
end