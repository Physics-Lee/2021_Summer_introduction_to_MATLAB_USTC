clc;clear;
syms t tau;
x=exp(-t^2/2);
y=int(subs(x,t,tau)*subs(x,t,t-tau),tau,-inf,inf);%x被替换后不会消失
%y为卷积结果