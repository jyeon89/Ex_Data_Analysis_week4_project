library(ggplot2)

nei_type <- data.table(NEI %>% group_by(year, fips, type) %>%
                                   summarise(total.emission = sum(Emissions)))

nei_balt_type <- subset(nei_type, fips == '24510')


g_type <- ggplot(nei_balt_type, aes(factor(year), total.emission))
g_type + geom_bar(stat = 'identity', aes(fill = type)) + 
      facet_grid(.~type) +
      labs(title=expression("Total Emission of PM"[2.5]*
                                  " for each of the Year in the Baltimore City by Source Type")) +
      ylab(expression('Total Emission of PM'[2.5]* ' (Tons)')) +
      xlab('Year') +
      geom_text(aes(label=round(total.emission, 2), size=1, hjust=0.5, vjust= -1), show.legend = FALSE)
