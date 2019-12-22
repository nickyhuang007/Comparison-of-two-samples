function [log,U,U_acc] = Runs_test(data1,data2)

m = length(data1);
n = length(data2);

[~,pos] = sort([data1 data2]);

U = 0;
for i = 2 : length(pos)
    if(pos(i-1) <= length(data1))
        if(pos(i) > length(data1))
            U = U + 1;
        end
    else
        if(pos(i) <= length(data1))
            U = U + 1;
        end
    end
end

U = U + 1;

u = 1 + (2 * m * n) / (m + n);
sig = (u - 1) * (u - 2) / (m + n - 1);
U_acc = u - 1.96 * sqrt(sig);

if(U < U_acc)
    log = 1;
else
    log = 0;
end