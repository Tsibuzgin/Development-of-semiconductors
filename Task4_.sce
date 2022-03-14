S=0.67e-4;
N0=2.3e22;
epsilon0=8.85e-12;
epsilon=12;
C1=0.0128e-6;
C2=0.0088e-6;
e=1.6e-19;
V1=1;
V2=4;
Vk=0.6;
z=log((Vk+V2)/(Vk+V1))/log(C1/C2);
disp(z)
h=epsilon*epsilon0*S/C1;
h1=sqrt(2*epsilon*epsilon0*(V1+Vk)/e/N0);
function r=f(q),
    r=h/h1*coth(q/2*h/h1)-2/q*h/h1-1
endfunction
bh1=fsolve(0.0001,f);
b=bh1/h1;
printf("%1.12f",h);
disp("");
printf("%1.12f",h1);
disp("");
printf("%1.12f",bh1);
disp(b);
N=zeros(1000);
y=zeros(1000);
for i=1:1000
    x=i*1e-9
    y(i)=x
    N(i)=N0*(1-exp(-b*x))
end
subplot(1,2,1);
plot2d(y,N);
xlabel("X", "fontsize", 2);
ylabel("N(X)", "fontsize", 2);
title("График N(X)", "fontsize", 2);
//Поиск z по трем точкам
function [zr]=G(c,z)
    zr=z(2)-c(1)-c(2)*z(1)
endfunction
function r=lC(Cb),
    r=log(Cb)
endfunction
function r=lV(V),
    r=log(1+V/Vk)
endfunction    
V=[0 10 20];
Cb=[100e-12 40e-12 31e-12];
x=zeros(3);
y=zeros(3);
for i=1:3
    x(i)=lV(V(i))
    y(i)=lC(Cb(i))
end
subplot(1,2,2);
plot2d(x,y,-4);
c=[0;0];
z=[x;y];
[c,err]=datafit(G,z,c);
t=0:0.01:4;
Ptc=c(1)+c(2)*t;
plot2d(t,Ptc);

