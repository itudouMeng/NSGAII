function value_new=simulated_binary_cross(value,problem,GAParameters)
pc=GAParameters.pc;
popsize=GAParameters.popsize;

lower=problem.lower;
upper=problem.upper;
numVar=problem.numVar;

%模拟二进制交叉
beta=@(u,n)(2*u).^(1+1/(n+1)).*(u<=0.5)+(2*(1-u)).^(-1-1/(n+1)).*(u>0.5);
u=rand(numVar,popsize/2);
B=beta(u,2);

p1=value(:,1:2:popsize);
p2=value(:,2:2:popsize);%
c1=(p1+p2)./2-0.5.*B.*(p2-p1);
c2=(p1+p2)./2+0.5.*B.*(p2-p1);

%判断是否交叉
is_cross=rand(1,popsize/2)<pc;
c1=(1-is_cross).*p1+is_cross.*c1;
c2=(1-is_cross).*p2+is_cross.*c2;

%越界处理
c1=(c1>=lower).*c1+(c1<lower).*lower;
c1=(c1<=upper).*c1+(c1>upper).*upper;
c2=(c2>=lower).*c2+(c2<lower).*lower;
c2=(c2<=upper).*c2+(c2>upper).*upper;

%返回交叉值-->newvalue
value_new(:,1:2:popsize)=c1;
value_new(:,2:2:popsize)=c2;