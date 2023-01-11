clc;clear;close all;

%画三角波
t=-10:0.01:10;
x=zeros(1,length(t));
for i=1:length(t)
    if 0<=mod(t(i),4)&&mod(t(i),4)<1
        x(i)=mod(t(i),4);
    elseif 1<=mod(t(i),4)&&mod(t(i),4)<3
        x(i)=2-mod(t(i),4);
    elseif 3<=mod(t(i),4)&&mod(t(i),4)<4
        x(i)=mod(t(i),4)-4;
    end
end
plot(t,x,'black');
hold on;
axis equal;

%画三角波的Fourier Series
N=20;
Fourier=zeros(1,length(t));
f0=1/4;%T=4，因此f0=1/4
for k=0:N
    Fourier=Fourier+8/(pi)^2*(-1)^(k).*sin(2*pi*f0*(2*k+1)*t)/(2*k+1)^2;
    plot(t,Fourier);
    legend;
end