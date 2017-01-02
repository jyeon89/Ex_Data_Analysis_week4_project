library(ggplot2)

## Coal combustion-related source

data <- merge(NEI, SCC, by = 'SCC')

combustionRelated <- grepl("comb", data$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", data$Short.Name, ignore.case=TRUE) 

coalComb <- (combustionRelated & coalRelated)


data_coalcomb <- data[coalComb, ]

coal_combustion <- data.table(data_coalcomb %>% group_by(year) %>%
                             summarise(total.emission = sum(Emissions)))

coal_combustion$total.emission <- coal_combustion$total.emission / 1000

g_coal <- ggplot(coal_combustion, aes(factor(year), total.emission))
g_coal + geom_bar(stat = 'identity') +
      labs(title=expression("Total Emission of PM"[2.5]*
                                  " for each of the Year (Coal Combustion)")) +
      ylab(expression('Total Emission of PM'[2.5]* ' (Kilotons)')) +
      xlab('Year') +
      geom_text(aes(label=round(total.emission, 2), size=1, hjust=0.5, vjust= -1), show.legend = FALSE)
