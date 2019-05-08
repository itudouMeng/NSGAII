function problem=set_problem(id)
switch id
	case 1
		problem.name='ZDT1';
		problem.upper=1;
		problem.lower=0;
		problem.numVar=30;
		problem.fun=@(x)ZDT1(x);
		problem.fun_pareto=@(y)ZDT1_pareto(y);
	case 2
		problem.name='ZDT2';
		problem.upper=1;
		problem.lower=0;
		problem.numVar=30;
		problem.fun=@(x)ZDT2(x);
		problem.fun_pareto=@(y)ZDT2_pareto(y);
	case 3
		problem.name='ZDT3';
		problem.upper=1;
		problem.lower=0;
		problem.numVar=30;
		problem.fun=@(x)ZDT3(x);
		problem.fun_pareto=@(y)ZDT3_pareto(y);
	case 4
		problem.name='ZDT4';
		problem.lower=[0;-5*ones(9,1)];
		problem.upper=[1;5*ones(9,1)];
		problem.numVar=10;
		problem.fun=@(x)ZDT4(x);
		problem.fun_pareto=@(y)ZDT4_pareto(y);
	case 5
		problem.name='ZDT6';
		problem.lower=0;
		problem.upper=1;
		problem.numVar=10;
		problem.fun=@(x)ZDT6(x);
		problem.fun_pareto=@(y)ZDT6_pareto(y);
	case 6
		problem.name='Schaffer function-1';
		A=1000;%A=[10,10^5];
		problem.lower=-A;
		problem.upper=A;
		problem.numVar=1;
		problem.fun=@(x)SCH1(x);
		problem.fun_pareto=@(y)SCH1_pareto(y);
end
end
%% 测试函数ZDT1
%ZDT1目标值函数
function y=ZDT1(x)
f1=x(1,:);
g=1+9/29.*sum(x(2:end,:));
h=1-sqrt(f1./g);
f2=g.*h;
y=[f1;f2];
end

%ZDT1的真实paretofront函数
function y=ZDT1_pareto(precision)
y1=0:precision:1;
y2=1-sqrt(y1);
y=[y1;y2];
end

%% 测试函数ZDT2
%ZDT2目标值函数
function y=ZDT2(x)
f1=x(1,:);
g=1+9/29.*sum(x(2:end,:));
h=1-(f1./g).^2;
f2=g.*h;
y=[f1;f2];
end

%ZDT2的真实pareto front函数
function y=ZDT2_pareto(precision)
y1=0:precision:1;
y2=1-y1.^2;
y=[y1;y2];
end

%% 测试函数ZDT3
%ZDT3目标值函数
function y=ZDT3(x)
f1=x(1,:);
g=1+9/29.*sum(x(2:end,:));
h=1-sqrt(f1./g)-f1./g.*sin(10*pi*f1);
f2=g.*h;
y=[f1;f2];
end

%ZDT3的真实pareto front函数
function y=ZDT3_pareto(precision)
y1=0:precision:1;
y2=1-sqrt(y1)-y1.*sin(10*pi*y1);
y=[y1;y2];
end

%% 测试函数ZDT4
%ZDT4目标值函数
function y=ZDT4(x)
n=10;
x1=x(1,:);
x2=x(2:n,:);
f1=x1;
g=1+10*(n-1)+sum(x2.^2-10*cos(4*pi.*x2));
h=1-sqrt(x1./g);
f2=g.*h;
y=[f1;f2];
end

%ZDT4的真实pareto front函数
function y=ZDT4_pareto(precision)
y1=0:precision:1;
g=1;
y2=g.*(1-sqrt(y1./g));
y=[y1;y2];
end

%% 测试函数ZDT6
%ZDT6目标值函数
function y=ZDT6(x)
n=10;
x1=x(1,:);
x2=x(2:n,:);
f1=1-exp(-4*x1).*(sin(6*pi*x1)).^6;
g=1+(n-1)*sum((x2/(n-1)).^0.25);
h=1-(f1./g).^2;
f2=g.*h;
y=[f1;f2];
end

%ZDT6的真实pareto front函数
function y=ZDT6_pareto(precision)
y1=0.28:precision:1;
g=1;
h=1-y1.^2;
y2=g.*h;
y=[y1;y2];
end

%% 测试函数Schaffer function 1
%Schaffer function 1目标值函数
function y=SCH1(x)
f1=x.^2;
f2=(x-2).^2;
y=[f1;f2];
end

%Schaffer function 1的真实pareto front函数
function y=SCH1_pareto(precision)
y1=0:precision:4;
y2=y1;
y=[y1;y2];
end