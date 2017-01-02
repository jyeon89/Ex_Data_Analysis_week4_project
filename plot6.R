library(ggplot2)

## Compare emissions from motor vehicle sources in Baltimore City 
## with emissions from motor vehicle sources in Los Angeles County


data <- merge(NEI, SCC, by = 'SCC')

mv_ba_la <- subset(data, type == 'ON-ROAD' & 
                              (fips == '24510' | fips == '06037'))


mv <- data.table(mv_ba_la %>% group_by(year, fips) %>%
                            summarise(total.emission = sum(Emissions)))

mv$fips[mv[, fips == '06037']] <- 'Los Angeles'
mv$fips[mv[, fips == '24510']] <- 'Baltimore'


g_mv_year <- ggplot(mv, aes(factor(year), total.emission))
g_mv_year + geom_bar(stat = 'identity', aes(fill = factor(year)))  + 
      facet_grid(. ~ fips) + 
      guides(fill=F) + 
      ggtitle('Total Emissions from Motor Vehicle Sources:  Baltimore City vs. Los Angeles City') + 
      ylab(expression('Total Emission of PM'[2.5]* ' (Tons)')) + 
      xlab('Year') +
      geom_text(aes(label=round(total.emission, 2), size=1, hjust=0.5, vjust= -1)) + 
      theme(legend.position='none')
