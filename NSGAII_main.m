clc;
clear;
close all;
profile on
%% ���ò��Ժ���
problem=set_problem(6);%1=ZDT1;	2=ZDT2;	3=ZDT3;	4=ZDT4; 5=ZDT6;	6=SCH1;

%% �Ŵ��㷨����
GAParameters.popsize=100;
GAParameters.maxgen=100;
GAParameters.pc=0.7;
GAParameters.pm=0.4;

%% ��Ⱥ��ʼ��
P=initialize_pop(problem,GAParameters);

%% ������
k=0;
while k<GAParameters.maxgen
	[P,Front]=nondominate_sort(P,GAParameters.popsize);%��֧������(nondominated sorting)
	P=crowding_distance(P,Front);%����ӵ���Ⱦ���(crowding distance)
	[P,Front]=sort_pop(P);%���շ�֧�����ȼ������ӵ���Ⱦ����С����Ⱥ��������
	plot_front(P(Front{1}),problem,k+1)%����paretoǰ��
	Q=tournament_select(P,GAParameters.popsize);%������ѡ��
		
	%%�Ŵ�����
	value=[Q.value];
	value=simulated_binary_cross(value,problem,GAParameters);%ģ������ƽ���
	value=polynomal_mutate(value,problem,GAParameters);%����ʽ����
	obj=problem.fun(value);%����Ŀ��ֵ
	
	%����Q
	for i=1:GAParameters.popsize
		Q(i).value=value(:,i);
		Q(i).obj=obj(:,i);
	end
	
	R=[P;Q];%P��Q���
	[R,Front]=nondominate_sort(R,2*GAParameters.popsize);%��֧������(nondominated sorting)
	R=crowding_distance(R,Front);%����ӵ���Ⱦ���(crowding distance)
	[R,~]=sort_pop(R);%���շ�֧�����ȼ������ӵ���Ⱦ������Ⱥ��������
	P=R(1:GAParameters.popsize);%������һ��Ⱥ��
	
	k=k+1;%���µ�������
end
%% ���ƽ��
legend('ParetoFront-NSGAII','ParetoFront-real');%��ӱ�ǩ
title(problem.name);%��ӱ���
profile viewer