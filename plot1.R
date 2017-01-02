## Total emission for each of the year
nei_year <- data.table(NEI %>% group_by(year) %>%
                             summarise(total.emission = sum(Emissions)))

nei_year$total.emission <- nei_year$total.emission/1000


barplot(nei_year$total.emission,
        names.arg = nei_year$year,  
        type = 'b', 
        pch = 19, 
        xlab = 'Year', 
        ylab = expression(paste('Total Emission of PM '[2.5], ' (kilotons)')), 
        main = expression(paste('Total Emission of PM'[2.5], ' for each of the Year')) )