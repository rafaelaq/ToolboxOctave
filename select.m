clear all
clc

A = zeros(10,50);
b = [];

X1_10 = [8 8 10 10 10 6 5 8 5 7];
X2_10 = [8 1 7 8 5 10 8 8 8 1];
X3_10 = [7 2 7 8 5 2 10 9 10 1];
X4_10 = [9 7 9 10 7 7 5 3 5 1];
X5_10 = [2 3 5 3 5 9 2 4 1 6];

Aux = [X1_10' X2_10' X3_10' X4_10' X5_10'];
c = reshape(Aux', 1, 50);
j=1;
jinicio = 1;

%preenchendo a matriz A com 1
for(i = 1:10)
    for(j = jinicio : jinicio+4)
        A(i,j) = 1;
    end 
    jinicio = jinicio+5;
end

res = zeros(2,50);
%criando as 5 linhas referentes as novas restrições
for(y = 1:5)
    indiceRes = y;
    for(k = 1:50)
        if(k == indiceRes)
            res(y,k) = 1;
            indiceRes = indiceRes+5;
        end
    end
end

A(11,:) = res(1,:);
A(12,:) = res(2,:);
A(13,:) = res(3,:);
A(14,:) = res(4,:);
A(15,:) = res(5,:);

lb = zeros(50,1); %piso
ub = ones(50,1); %teto
b = [ones(10,1)]; 
b(11:15,1) = 2;
Ctype(1:15) = "S"; %Ax = b
Vartype(1:50) = "I"; %números inteiros    

%resolvendo o problema
x = glpk(c,A,b,lb,ub,Ctype,Vartype,-1);
xMatriz = reshape(x,5,10)
custo = c*x
