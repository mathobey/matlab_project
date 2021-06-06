T = readtable('countries-aggregated.csv');
Country = string(T.Country);
People = T.Confirmed;
Country_list = unique(Country);
number_of_countries = length(Country_list);
number_of_days = length(Country)/number_of_countries;
Date = T.Date;
Date = Date(1:number_of_days);
Matrix = zeros(number_of_days,number_of_countries);
Table = array2table(Matrix,'VariableNames',Country_list');
%Table.Date = Date;
for k=1:number_of_countries
    column = People((k-1)*number_of_days+1:k*number_of_days);
    Table(:,k) = num2cell(column);
end
Matrix_diff = table2array(Table);
for k=number_of_days:-1:2
    Matrix_diff(k,:) = 100*(Matrix_diff(k,:) - Matrix_diff(k-1,:))./Matrix_diff(k,:);
end
Matrix_diff = Matrix_diff(2:number_of_days,:);
Table_diff = array2table(Matrix_diff,'VariableNames',Country_list');
writetable(Table_diff,'covid_data.xlsx');