function value_new=polynomal_mutate(value,problem,GAParameters)
pm=GAParameters.pm;
popsize=GAParameters.popsize;

lower=problem.lower;
upper=problem.upper;
numVar=problem.numVar;

%����ʽ����
delta=@(u,n)(u<=0.5).*((2*u).^(1/(1+n))-1)+...
	(u>0.5).*(1-(2*(1-u)).^(1/(1+n)));
u=rand(numVar,popsize);
D=delta(u,2);

p=value;%p:����
c=value+D.*(upper-lower);%c:�Ӵ�

%�ж��Ƿ����
is_mutate=rand(1,popsize)<pm;
c=(1-is_mutate).*p+is_mutate.*c;

%Խ�紦��
c=(c>=lower).*c+(c<lower).*lower;
c=(c<=upper).*c+(c>upper).*upper;

%���ر���ֵ
value_new=c;