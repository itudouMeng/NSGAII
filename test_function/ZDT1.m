function y=ZDT1(x)
%% ���Ժ���ZDT1
%ZDT1Ŀ��ֵ����
f1=x(1,:);
g=1+9/29.*sum(x(2:end,:));
h=1-sqrt(f1./g);
f2=g.*h;
y=[f1;f2];
end