function [log,T,r1,r2] = Wilconxon_rank_test(data1,data2)%Wilconxon÷»∫ÕºÏ—È

m = length(data1);
n = length(data2);

[~,pos] = sort([data1 data2]);

T = 0;
for i = 1 : length(pos)
    if(pos(i) <= length(data1))
        T = T + i;
    end
end

r1 = 0.5 * m * (m + n + 1) - 1.96 * sqrt(m * n * (m + n + 1) / 12);
r2 = 0.5 * m * (m + n + 1) + 1.96 * sqrt(m * n * (m + n + 1) / 12);

if(T <= r2 && T >= r1)
    log = 0;
else
    log = 1;
end
