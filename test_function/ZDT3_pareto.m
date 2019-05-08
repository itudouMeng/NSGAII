function y=ZDT3_pareto(precision)
%ZDT3的真实pareto front函数
y1=0:precision:1;
y2=1-sqrt(y1)-y1.*sin(10*pi*y1);
y=[y1;y2];
end