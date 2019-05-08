function [pop,Front]=sort_pop(pop)
%第一步：首先是拥挤度距离从大到小排序
Distance=[pop.CrowdingDistance];
[~,I]=sort(Distance,'descend');
pop=pop(I);

%第二步：然后是非支配优先级从高到低排序
[Rank,I]=sort([pop.rank]);
pop=pop(I);

maxRank=Rank(end);
Front=cell(maxRank,1);
for k=1:maxRank
	Front{k}=find(Rank==k);
end
