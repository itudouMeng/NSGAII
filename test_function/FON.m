function y=FON(x)
%%Fonseca-Fleming function��Ŀ�꺯��
n=3;
a=1/sqrt(n);
f1=1-exp(-sum((x-a).^2));
f2=1-exp(-sum((x+a).^2));
y=[f1;f2];