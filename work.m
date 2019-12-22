clc
clear

N = 1000;
M = 25;
d = 1;
p1 = zeros(1,M/d);
p2 = zeros(1,M/d);
p3 = zeros(1,M/d);
p4 = zeros(1,M/d);
p5 = zeros(1,M/d);
p6 = zeros(1,M/d);
k = 1;

for j = 1 : d : M

for i = 1 : N

  data1 = normrnd(0,1,[1 50]);
  data2 = normrnd(0,j,[1 50]);

  [log1,~,~,~] = sig_test(data1',data2');  %符号
  [log2,~,~,~] = Wilconxon_rank_test(data1,data2);
  [log3,~,~] = sig_rank_test(data1,data2);
  [log4,~,~] = Runs_test(data1,data2);

  log5 = kstest2(data1,data2);
  [log6,~,~,~] = MWW_test(data1,data2);
  if(log1 == 1)
      p1(k) = p1(k) + 1;
  end

  if(log2 == 1)
      p2(k) = p2(k) + 1;
  end
  
  if(log3 == 1)
      p3(k) = p3(k) + 1;
  end  
  
  if(log4 == 1)
      p4(k) = p4(k) + 1;
  end    
 
  if(log5 == 1)
      p5(k) = p5(k) + 1;
  end   
  
  if(log6 == 1)
      p6(k) = p6(k) + 1;
  end   
  
end
  k = k + 1;
end

x = 1 : M/d;
plot(x,p1,x,p2,x,p3,x,p4,x,p5,x,p6);
title('方差从1到25正确判断次数')
ylabel('正确判断次数')
%[log2,T,r21,r22] = Wilconxon_rank_test(data1,data2);  %秩和

% [log3,T2,T2_acc] = sig_rank_test(data1,data2);  %符号秩和

% [log4,U,U_acc] = Runs_test(data1,data2);   %游程
            
% h = kstest2(data1,data2);  %Smirnov

% [log,U,r1,r2] = MWW_test(data1,data2);  %MWW检验
