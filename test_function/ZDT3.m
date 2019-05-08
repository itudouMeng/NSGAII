
function y=ZDT3(x)
%% 测试函数ZDT3
%ZDT3目标值函数
f1=x(1,:);
g=1+9/29.*sum(x(2:end,:));
h=1-sqrt(f1./g)-f1./g.*sin(10*pi*f1);
f2=g.*h;
y=[f1;f2];
end