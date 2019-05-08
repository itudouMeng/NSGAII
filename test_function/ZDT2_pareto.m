function y=ZDT2_pareto(precision)
%ZDT2的真实pareto front函数
y1=0:precision:1;
y2=1-y1.^2;
y=[y1;y2];
end