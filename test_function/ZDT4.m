function y=ZDT4(x)
%% ���Ժ���ZDT4
%ZDT4Ŀ��ֵ����
n=10;
x1=x(1,:);
x2=x(2:n,:);
f1=x1;
g=1+10*(n-1)+sum(x2.^2-10*cos(4*pi.*x2));
h=1-sqrt(x1./g);
f2=g.*h;
y=[f1;f2];
end