function y=ZDT6_pareto(precision)
%ZDT6����ʵpareto front����
y1=0.28:precision:1;
g=1;
h=1-y1.^2;
y2=g.*h;
y=[y1;y2];
end