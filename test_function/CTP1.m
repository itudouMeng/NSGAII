function f=CTP1(var)
x=var(1,:);
y=var(2,:);
% g1=y+9*x>=6;
% g2=-y+9*x>=1;
% u=g1.*g2;
% f1=u.*x+(~u).*inf;
% f2=u.*((1+y)./x)+(~u).*inf;
f1=x;
f2=(1+y)./x;
f=[f1;f2];
