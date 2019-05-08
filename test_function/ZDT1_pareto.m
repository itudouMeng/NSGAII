function y=ZDT1_pareto(precision)
%ZDT1的真实paretofront函数
y1=0:precision:1;
y2=1-sqrt(y1);
y=[y1;y2];
end