function plot_front(P_pareto,problem, k)
%绘制pareto前沿
disp(['k = ' num2str(k) ' // Pareto Front = ' num2str(size(P_pareto,1))]);
figure(1);
PF = [P_pareto.obj];%计算得到的pareto前沿
real_PF=problem.fun_pareto(0.001);%真实pareto前沿
plot(PF(1,:),PF(2,:),'.');
hold on
plot(real_PF(1,:),real_PF(2,:),'r');
xlabel('f1');
ylabel('f2');
grid on;
% legend('ParetoFront-NSGAII','ParetoFront-real');
hold off