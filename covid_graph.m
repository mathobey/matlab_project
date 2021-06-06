function p = covid_graph(names,date)
Table = readtable('covid_data.xlsx');
d_1 = 1 + days(datetime(date) - datetime('2020-01-22'));
d_2 = days(datetime('2021-06-03') - datetime(date));
date_array = datestr(datetime(date) + days(0:d_2-1));
for k=1:length(names)
    x = Table(:,names{k});
    x = table2array(x);
    x = x(d_1:498);
    ts = timeseries(x,date_array);
    ts.Name = names{k};
    ts.TimeInfo.Units = 'days';
    ts.TimeInfo.StartDate = date;    
    ts.TimeInfo.Format = 'mmm dd, yy';  
    plot(ts);
    hold on;
end
title('График процентного прироста');
ylabel('Процент прироста');
xlabel('Дата');
legend(string(names),'Location','northeast')
hold off;
