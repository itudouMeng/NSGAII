function value_new=polynomal_mutate(value,problem,GAParameters)
pm=GAParameters.pm;
popsize=GAParameters.popsize;

lower=problem.lower;
upper=problem.upper;
numVar=problem.numVar;

%多项式变异
delta=@(u,n)(u<=0.5).*((2*u).^(1/(1+n))-1)+...
	(u>0.5).*(1-(2*(1-u)).^(1/(1+n)));
u=rand(numVar,popsize);
D=delta(u,2);

p=value;%p:父代
c=value+D.*(upper-lower);%c:子代

%判断是否变异
is_mutate=rand(1,popsize)<pm;
c=(1-is_mutate).*p+is_mutate.*c;

%越界处理
c=(c>=lower).*c+(c<lower).*lower;
c=(c<=upper).*c+(c>upper).*upper;

%返回变异值
value_new=c;