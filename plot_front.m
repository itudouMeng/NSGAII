function plot_front(P_pareto,problem, k)
%����paretoǰ��
disp(['k = ' num2str(k) ' // Pareto Front = ' num2str(size(P_pareto,1))]);
figure(1);
PF = [P_pareto.obj];%����õ���paretoǰ��
plot(PF(1,:),PF(2,:),'.');
if problem.is_realPF%�Ƿ������ʵpareto front
	realPF=problem.real_pareto_front;%��ʵparetoǰ��
	hold on
	plot(realPF(1,:),realPF(2,:),'r');
	hold off
end
xlabel('f1');
ylabel('f2');
grid on;
% legend('ParetoFront-NSGAII','ParetoFront-real');
