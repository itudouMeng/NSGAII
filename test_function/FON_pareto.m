function y=FON_pareto(precision)
%Fonseca-Fleming function����ʵpareto front����
b=2;
x=0:precision:b;
y1=1-exp(-x.^2);
y2=1-exp(-(x-b).^2);
y=[y1;y2];