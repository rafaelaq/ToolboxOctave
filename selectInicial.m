  clear all
  clc

  A = zeros(10,50);

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

  lb = zeros(50,1); %piso
  ub = ones(50,1); %teto
  b = [ones(10,1)];
  Ctype(1:10) = "S"; %Ax = b
  Vartype(1:50) = "I"; %números inteiros  

  %resolvendo o problema
  x = glpk(c,A,b,lb,ub,Ctype,Vartype,-1);
  xMatriz = reshape(x,5,10)
  custo = c*x
