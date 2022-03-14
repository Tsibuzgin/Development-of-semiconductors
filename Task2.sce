function [z]=N(y,M)
    z=integrate('exp(-x^2)*erfc(M*x)','x',y,10)
endfunction
NS=101;
h=2.5/(NS-1);
M=[0.01 0.25 1.0 4.0 10.0];
R=zeros(NS,5);
y=zeros(NS,5);  
for i=1:5
    for j=1:NS
    y(j,i)=(j-1)*h;
    R(j,i)=N(y(j,i),M(i));
    end
end

plot(y,R);
xlabel("X", "fontsize", 2);
ylabel("N(X)", "fontsize", 2);
title(" График N(X)", "fontsize", 2);




