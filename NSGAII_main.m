clc;
clear;
close all;
profile on
%% 设置测试函数
problem=set_problem(6);%1=ZDT1;	2=ZDT2;	3=ZDT3;	4=ZDT4; 5=ZDT6;	6=SCH1;

%% 遗传算法参数
GAParameters.popsize=100;
GAParameters.maxgen=100;
GAParameters.pc=0.7;
GAParameters.pm=0.4;

%% 种群初始化
P=initialize_pop(problem,GAParameters);

%% 主程序
k=0;
while k<GAParameters.maxgen
	[P,Front]=nondominate_sort(P,GAParameters.popsize);%非支配排序(nondominated sorting)
	P=crowding_distance(P,Front);%计算拥挤度距离(crowding distance)
	[P,Front]=sort_pop(P);%按照非支配优先级排序和拥挤度距离大小对种群进行排序
	plot_front(P(Front{1}),problem,k+1)%绘制pareto前沿
	Q=tournament_select(P,GAParameters.popsize);%锦标赛选择
		
	%%遗传操作
	value=[Q.value];
	value=simulated_binary_cross(value,problem,GAParameters);%模拟二进制交叉
	value=polynomal_mutate(value,problem,GAParameters);%多项式变异
	obj=problem.fun(value);%计算目标值
	
	%更新Q
	for i=1:GAParameters.popsize
		Q(i).value=value(:,i);
		Q(i).obj=obj(:,i);
	end
	
	R=[P;Q];%P和Q混合
	[R,Front]=nondominate_sort(R,2*GAParameters.popsize);%非支配排序(nondominated sorting)
	R=crowding_distance(R,Front);%计算拥挤度距离(crowding distance)
	[R,~]=sort_pop(R);%按照非支配优先级排序和拥挤度距离对种群进行排序
	P=R(1:GAParameters.popsize);%产生新一代群体
	
	k=k+1;%更新迭代次数
end
%% 绘制结果
legend('ParetoFront-NSGAII','ParetoFront-real');%添加标签
title(problem.name);%添加标题
profile viewer