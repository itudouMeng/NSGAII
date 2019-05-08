function y=ZDT6(x)
%% 测试函数ZDT6
%ZDT6目标值函数
n=10;
x1=x(1,:);
x2=x(2:n,:);
f1=1-exp(-4*x1).*(sin(6*pi*x1)).^6;
g=1+(n-1)*sum((x2/(n-1)).^0.25);
h=1-(f1./g).^2;
f2=g.*h;
y=[f1;f2];
end