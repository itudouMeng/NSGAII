function plot_front(P_pareto,problem, k)
%����paretoǰ��
disp(['k = ' num2str(k) ' // Pareto Front = ' num2str(size(P_pareto,1))]);
figure(1);
PF = [P_pareto.obj];%����õ���paretoǰ��
real_PF=problem.fun_pareto(0.001);%��ʵparetoǰ��
plot(PF(1,:),PF(2,:),'.');
hold on
plot(real_PF(1,:),real_PF(2,:),'r');
xlabel('f1');
ylabel('f2');
grid on;
% legend('ParetoFront-NSGAII','ParetoFront-real');
hold off