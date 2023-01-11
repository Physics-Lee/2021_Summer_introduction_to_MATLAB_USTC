clc;clear;
global mu;
mu=3;
y0=[1;0];
[t,x]=ode45(@MyVerderPol,[0,40],y0);
plot(t,x(:,1),'r-o');
hold on;
plot(t,x(:,2),'b-o');
figure(2)
plot(x(:,1),x(:,2));