function pop=crowding_distance(pop,Front)
numFront=length(Front);
numObj=2;
for i=1:numFront
	F=Front{i};
	numF=length(F);
	obj=[pop(F).obj];	
	Distance=zeros(numF,numObj);
	
	for j=1:numObj
		[obj_sort,I]=sort(obj(j,:));
		Distance(I(1),j)=inf;
		for k=2:numF-1
			Distance(I(k),j)=abs((obj_sort(k+1)-obj_sort(k-1))/...
				(obj_sort(end)-obj_sort(1)));
		end
		Distance(I(end),j)=inf;
	end
	
	for j=1:numF
		pop(F(j)).CrowdingDistance=sum(Distance(j,:));
	end
end