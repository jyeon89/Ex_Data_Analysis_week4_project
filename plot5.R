library(ggplot2)

## emissions from motor vehicle sources changed from 1999-2008 in Baltimore City

data <- merge(NEI, SCC, by = 'SCC')

motor.vehicle <- subset(data, type == 'ON-ROAD' & 
                              fips == '24510')

mv_year <- data.table(motor.vehicle %>% group_by(year) %>%
                            summarise(total.emission = sum(Emissions)))
                      

g_mv_year <- ggplot(mv_year, aes(factor(year), total.emission))
g_mv_year + geom_bar(stat = 'identity', aes(fill = factor(year))) + 
      guides(fill=F) + 
      ggtitle('Total Emissions from Motor Vehicle Sources in Baltimore City') + 
      ylab(expression('Total Emission of PM'[2.5]* ' (Tons)')) + 
      xlab('Year') +
      geom_text(aes(label=round(total.emission, 2), size=1, hjust=0.5, vjust=2)) + 
      theme(legend.position='none') 
