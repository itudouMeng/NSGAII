function pop=initialize_pop(problem,GAParameters)
individual.value=0;
individual.obj=0;
individual.rank=0;
individual.CrowdingDistance=0;
individual.DominateSet=[];
individual.DominatedCount=0;

popsize=GAParameters.popsize;
pop=repmat(individual,popsize,1);
lower=problem.lower;
upper=problem.upper;
numVar=problem.numVar;

value=lower+(upper-lower).*rand(numVar,popsize);
value(:,1)=upper;
value(:,2)=lower;
value(:,3)=(upper+lower)/2;
for k=1:popsize
	val=value(:,k);
	pop(k).value=val;
	pop(k).obj=problem.fun(val);
end