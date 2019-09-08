## Question 3:
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a 
## plot answer this question.

## Open ggplot2 package
library(ggplot2)

## Read the files from your working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## create a subset with data from Baltimore City only
BaltimoreCityEmissions <- NEI[NEI$fips=="24510",]

## calculate the total PM2.5 emissions by year in Baltimore City
TotalEmissionsBaltimoreCitybyYearandType <- aggregate(Emissions ~ year + type, 
                                                      BaltimoreCityEmissions, sum)

## plot total emissions in Baltimore city by year  and type and print a png file
png("plot3.png", width=640, height=480)
g <- ggplot(TotalEmissionsBaltimoreCitybyYearandType, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("Year") +
  ylab("Total PM2.5 Emissions") +
  ggtitle('Total PM2.5 Emissions in Baltimore City by Year (1999 to 2008)')
print(g)
dev.off()
