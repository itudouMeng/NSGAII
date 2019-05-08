function newpop=tournament_select(pop,popsize)
%% Ωı±Í»¸—°‘Ò
for k=1:popsize
	candidate=randperm(popsize,2);
	candidate_win=min(candidate);
	newpop(k,1)=pop(candidate_win);
end
% N=unidrnd(popsize,popsize,1);
% for k=1:popsize
% 	candidate=randperm(popsize,N(k));
% 	candidate_win=min(candidate);
% 	newpop(k,1)=pop(candidate_win);
% end