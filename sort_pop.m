function [pop,Front]=sort_pop(pop)
%��һ����������ӵ���Ⱦ���Ӵ�С����
Distance=[pop.CrowdingDistance];
[~,I]=sort(Distance,'descend');
pop=pop(I);

%�ڶ�����Ȼ���Ƿ�֧�����ȼ��Ӹߵ�������
[Rank,I]=sort([pop.rank]);
pop=pop(I);

maxRank=Rank(end);
Front=cell(maxRank,1);
for k=1:maxRank
	Front{k}=find(Rank==k);
end
