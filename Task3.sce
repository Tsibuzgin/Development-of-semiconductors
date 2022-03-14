Nd1=1.1e4;  
Nd0=1.6e13;
Ld=0.68;
Na0=5e6;
La=1.5;
function z=N(x),
    z=Nd1+Nd0/sqrt(%pi)*Ld/x*exp(-(x/Ld)^2)-Na0*exp(-(x/La)^2);
endfunction
NS=1000;
h=0.005;
x=zeros(NS);
NN=zeros(NS);
MM=zeros(NS);
y=zeros(NS);
for j=1:NS,
    x(j)=j*h;
    NN(j)=log(abs(N(x(j))));
    MM(j)=N(x(j));
    y(j)=0;
end
A=fsolve(2,N);
B=fsolve(3,N);
subplot(1,2,1);
plot2d(x,MM,rect=[2,-1D5,5,1D5]);
plot2d(x,y,rect=[2,-1D5,5,1D5]);
xlabel("Х", "fontsize", 2);
ylabel("N(Х)", "fontsize", 2);
title(" График N(Х)", "fontsize", 2);
subplot(1,2,2);
plot2d(x,NN);
xlabel("X", "fontsize", 2);
ylabel("lnN(X)", "fontsize", 2);
title(" График lnN(X)", "fontsize", 2);
disp("A");
printf("%1.12f",A);
disp("B")
printf("%1.12f",B);
disp("Ширина базы WO")
printf("%1.12f",B-A);
aA=numderivative(N,A);
aB=numderivative(N,B);
disp(aA,aB)

a=aA;
t=23;
e=1.6e-19;
epsilon=12;
epsilon0=8.85e-18;
function l=Lambda(t),
    l=11608/(273+t);    
endfunction
function o=n(t),
    o=(8.69e15*(273+t)^1.5)/exp(0.55*Lambda(t))
endfunction
function z=Vk1(x),
    z=2/Lambda(t)*log(abs(a)*x/(2*n(t)))
endfunction
function z=Vk2(x),
    z=e*abs(a)*x^3/(12*epsilon*epsilon0)
endfunction
function z=Vk(x),
    z=Vk1(x)-Vk2(x)
endfunction

h0A=fsolve(1,Vk);
disp("h0A");
printf("%1.3f",h0A);
//disp(h0A);
//Vem=Vk1(h0A,aA);
//h0B=fsolve(h0B,aB);


