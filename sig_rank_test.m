function [log,T,T_acc] = sig_rank_test(data1,data2)

abs_new_data = abs(data1 - data2);
new_data = data1 - data2;
[~,pos] = sort(abs_new_data);

T1 = 0;  %¸º
T2 = 0;  %Õý
for i = 1 : length(pos)
    if(new_data(pos(i)) < 0)
        T1 = T1 + i;
    elseif(new_data(pos(i)) > 0)
        T2 = T2 + i;
    end
end
    
T = min(T1,T2);    

n = length(new_data);

u = n * (n + 1) / 4;
sig = n * (n + 1) * (2 * n + 1) /24;
T_acc = u - 1.96 * sqrt(sig);

if(T <= T_acc)
    log = 1;
else
    log = 0;
end