function plot_front(P_pareto,problem, k)
%绘制pareto前沿
disp(['k = ' num2str(k) ' // Pareto Front = ' num2str(size(P_pareto,1))]);
figure(1);
PF = [P_pareto.obj];%计算得到的pareto前沿
plot(PF(1,:),PF(2,:),'.');
if problem.is_realPF%是否绘制真实pareto front
	realPF=problem.real_pareto_front;%真实pareto前沿
	hold on
	plot(realPF(1,:),realPF(2,:),'r');
	hold off
end
xlabel('f1');
ylabel('f2');
grid on;
% legend('ParetoFront-NSGAII','ParetoFront-real');
