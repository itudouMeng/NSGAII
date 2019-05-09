function y=KUR(x)
%%Fonseca-Fleming function的目标函数
x1=x(1,:);
x2=x(2,:);
x3=x(3,:);
f1=-10*exp(-0.2*sqrt(x1.^2+x2.^2))-10*exp(-0.2*sqrt(x2.^2+x3.^2));
f=@(x)abs(x).^0.8+5*sin(x.^3);
f2=f(x1)+f(x2)+f(x3);
y=[f1;f2];