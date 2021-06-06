function date_of_stab = stab_data(name,percent,period)
Table = readtable('covid_data.xlsx');
col = Table(:,name);
k_first = 498;
for k=1:(498 - period)
    flag = 0;
    for i=1:period
        if col{k+i-1,1}<percent
            flag = flag+1;
        end
    end
    if flag==period
        k_first = k;
        break;
    end
end
date_of_stab = datetime('2020-01-22') + days(k_first);