function y=ZDT4_pareto(precision)
%ZDT4的真实pareto front函数
y1=0:precision:1;
g=1;
y2=g.*(1-sqrt(y1./g));
y=[y1;y2];
end