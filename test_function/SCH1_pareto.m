%Schaffer function 1����ʵpareto front����
function y=SCH1_pareto(precision)
x=0:precision:2;
y1=x.^2;
y2=(2-x).^2;
y=[y1;y2];
end