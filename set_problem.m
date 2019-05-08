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











