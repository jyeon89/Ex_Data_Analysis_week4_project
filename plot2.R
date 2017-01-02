## by state
nei_year_state <- data.table(NEI %>% group_by(year, fips) %>%
                                   summarise(total.emission = sum(Emissions)))
nei_balt <- subset(nei_year_state, fips == '24510')


barplot(nei_balt$total.emission,
        names.arg = nei_balt$year,  
        type = 'b', 
        pch = 19, 
        xlab = 'Year', 
        ylab = expression(paste('Total Emission of PM '[2.5], ' (Tons)')), 
        main = expression(paste('Total Emission of PM'[2.5], ' for each of the Year in the Baltimore City')) )
