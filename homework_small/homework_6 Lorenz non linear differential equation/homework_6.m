function dy=homework_6(~,y)%y=[x,y,z]
    global sigma rou beta;%全局变量
    dy=[sigma*(y(2)-y(1));y(1)*(rou-y(3))-y(2);y(1)*y(2)-beta*y(3)];%dy=[dx/dt dy/dt dz/dt]
end