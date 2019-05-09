function problem=set_problem(id)
precision=0.001;
problem.is_realPF=1;%真实pareto front是否可得到
switch id
	case 1
		problem.name='ZDT1';
		problem.upper=1;
		problem.lower=0;
		problem.numVar=30;
		problem.fun=@(x)ZDT1(x);
% 		problem.fun_pareto=@(precision)ZDT1_pareto(precision);
		problem.real_pareto_front=ZDT1_pareto(precision);
	case 2
		problem.name='ZDT2';
		problem.upper=1;
		problem.lower=0;
		problem.numVar=30;
		problem.fun=@(x)ZDT2(x);
% 		problem.fun_pareto=@(precision)ZDT2_pareto(precision);
		problem.real_pareto_front=ZDT2_pareto(precision);
	case 3
		problem.name='ZDT3';
		problem.upper=1;
		problem.lower=0;
		problem.numVar=30;
		problem.fun=@(x)ZDT3(x);
% 		problem.fun_pareto=@(precision)ZDT3_pareto(precision);
		problem.real_pareto_front=ZDT3_pareto(precision);
	case 4
		problem.name='ZDT4';
		problem.lower=[0;-5*ones(9,1)];
		problem.upper=[1;5*ones(9,1)];
		problem.numVar=10;
		problem.fun=@(x)ZDT4(x);
% 		problem.fun_pareto=@(precision)ZDT4_pareto(precision);
		problem.real_pareto_front=ZDT4_pareto(precision);
	case 5
		problem.name='ZDT6';
		problem.lower=0;
		problem.upper=1;
		problem.numVar=10;
		problem.fun=@(x)ZDT6(x);
% 		problem.fun_pareto=@(precision)ZDT6_pareto(precision);
		problem.real_pareto_front=ZDT6_pareto(precision);
	case 6
		problem.name='Schaffer function-1';
		A=1000;%A=[10,10^5];
		problem.lower=-A;
		problem.upper=A;
		problem.numVar=1;
		problem.fun=@(x)SCH1(x);
% 		problem.fun_pareto=@(precision)SCH1_pareto(precision);
		problem.real_pareto_front=SCH1_pareto(precision);
	case 7
		problem.name='Schaffer function-2';
		problem.lower=-5;
		problem.upper=10;
		problem.numVar=1;
		problem.fun=@(x)SCH2(x);
% 		problem.fun_pareto=@(precision)SCH2_pareto(precision);
		problem.real_pareto_front=SCH2_pareto(precision);
	case 8
		problem.name='Fonseca-Fleming function';
		problem.lower=-4;
		problem.upper=4;
		problem.numVar=3;
		problem.fun=@(x)FON(x);
% 		problem.fun_pareto=@(precision)FON_pareto(precision);
		problem.real_pareto_front=FON_pareto(precision);
	case 9
		problem.name='Kursawe function';
		problem.lower=-5;
		problem.upper=5;
		problem.numVar=3;
		problem.fun=@(x)KUR(x);
		problem.is_realPF=0;
	case 10
		problem.name='Poloni-two-objective funtion';
		problem.lower=-pi;
		problem.upper=pi;
		problem.numVar=2;
		problem.fun=@(x)POL(x);
		problem.is_realPF=0;
end
end











