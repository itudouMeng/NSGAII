function [P,Front]=nondominate_sort(P,popsize)
Front{1}=[];
for i=1:popsize
	P(i).rank=0;
	P(i).CrowdingDistance=0;
	P(i).DominateSet=[];
	P(i).DominatedCount=0;
end

for i=1:popsize-1
	for j=i+1:popsize
		%非支配排序
		if all(P(i).obj<=P(j).obj)&&any(P(i).obj<P(j).obj)
			P(i).DominateSet(end+1)=j;
			P(j).DominatedCount=P(j).DominatedCount+1;
		elseif all(P(j).obj<=P(i).obj)&&any(P(j).obj<P(i).obj)
			P(j).DominateSet(end+1)=i;
			P(i).DominatedCount=P(i).DominatedCount+1;
		end
	end
end
%第一级前沿:rank=1
for i=1:popsize
	if P(i).DominatedCount==0
		P(i).rank=1;
		Front{1}(end+1)=i;
	end
end
%计算各级前沿：rank=2,3,...
rank_num=1;
while true
	Q=[];
	for i=1:length(Front{rank_num})
		f=Front{rank_num}(i);
		DominateSet=P(f).DominateSet;
		for j=1:length(DominateSet)
			s=DominateSet(j);
			P(s).DominatedCount=P(s).DominatedCount-1;
			if P(s).DominatedCount==0
				P(s).rank=rank_num+1;
				Q(end+1)=s;
			end
		end
	end
	if isempty(Q)
		break;
	end
	rank_num=rank_num+1;
	Front{rank_num,1}=Q;
end