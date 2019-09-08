## Question 4:
## Across the United States, how have emissions from coal combustion-related sources changed
## from 1999–2008?

## Read the files from your working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## open ggplot2 package
library(ggplot2)

## first merge the two data sets so that the sources can be identified by name
Alldata <- merge(NEI, SCC, by="SCC")

## calculate total emissions from coal combustion-related sources (Short.Name cotains "coal")
## first create a logical vector called DataFromCoalSources
DataFromCoalSources <- grepl("coal", Alldata$Short.Name, ignore.case = TRUE)
## then create a subset of the merged data frame ALLdata by only selcting the entries from coal sources
CoalSourcesSubset <- AllData[DataFromCoalSources, ]

## calculate the total emissions by coal sources by year
CoalSourcesbyYear <- aggregate(Emissions ~ year, CoalSourcesSubset, sum)

## plot total emissions from coal sources by year
png("plot4.png", width=640, height = 480)
g <- ggplot(CoalSourcesbyYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="Identity") +
  xlab("Year") +
  ylab("Total PM2.5 Emissions") + 
  ggtitle("Total PM2.5 Emissions from Coal Sources (1999-2008)")
print(g)
dev.off()
