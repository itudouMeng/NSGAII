function y=ZDT1_pareto(precision)
%ZDT1����ʵparetofront����
y1=0:precision:1;
y2=1-sqrt(y1);
y=[y1;y2];
end