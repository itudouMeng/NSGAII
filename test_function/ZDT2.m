function y=ZDT2(x)
%% ���Ժ���ZDT2
%ZDT2Ŀ��ֵ����
f1=x(1,:);
g=1+9/29.*sum(x(2:end,:));
h=1-(f1./g).^2;
f2=g.*h;
y=[f1;f2];
end