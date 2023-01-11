function dy=MyVerderPol(~,y)%y=[y(1),y(2)]
    global mu;
    dy=[y(2);mu*(1-y(1).^2).*y(2)-y(1)];%y(1)为原函数，y(2)为一阶导数，dy(2)为二阶导数
end