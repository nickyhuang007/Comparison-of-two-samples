function [log,z,r1,r2] = sig_test(data1,data2)%·ûºÅ¼ìÑé

dif = length(data1) - length(data2);
if(dif > 0)
    new_data = zeros(length(data2),1);
    temp = randperm(length(data1),dif);
    temp = sort(temp);
    k = 1;
    j = 1;
    for i = 1 : length(data1)
        if(i ~= temp(j))
            new_data(k) = data1(i,1);
            k = k + 1;
        else
            j = j + 1;
            if(j > dif)
                j = dif;
            end
        end
    end
    z = 0;
    for i = 1 : length(new_data)
        if(new_data(i) > data2(i,1))
            z = z + 1;
        end
    end
elseif(dif < 0)
    new_data = zeros(length(data1),1);
    temp = randperm(length(data2),-dif);
    temp = sort(temp);
    k = 1;
    j = 1;
    for i = 1 : length(data2)
        if(i ~= temp(j))
            new_data(k) = data2(i,1);
            k = k + 1;
        else
            j = j + 1;
            if(j > -dif)
                j = -dif;
            end
        end
    end
    z = 0;
    for i = 1 : length(new_data)
        if(new_data(i) > data1(i,1))
            z = z + 1;
        end
    end
    
elseif(dif == 0)
    new_data = data1;
    z = 0;
    for i = 1 : length(new_data)
        if(new_data(i) > data2(i,1))
            z = z + 1;
        end
    end
    
end

temp = 1.96 * sqrt(length(new_data)/4);
r1 = length(new_data)/2 - temp;
r2 = length(new_data)/2 + temp;

if(z >= r1 && z <= r2)
    log = 0;
else
    log = 1;
end