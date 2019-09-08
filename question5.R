## Question 5:

## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

## Read the files from your working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## open ggplot2 package
library(ggplot2)

## first merge the two data sets so that the sources can be identified by name
Alldata <- merge(NEI, SCC, by="SCC")

## create a subset with data from Baltimore City AND generates from motor-vehicles "ON-ROAD" type
BaltimoreCityEmissionsONROAD <- NEI[NEI$fips=="24510" & NEI$type == "ON-ROAD", ]

## calculate the total emissions in Baltimore from motor vehicles (ON-ROAD)
TotalBaltimoreONROAD <- aggregate(Emissions ~ year, BaltimoreCityEmissionsONROAD, sum)

## plot total emissions from Baltimore by year from motor vehicles (ON-ROAD type)
png("plot5.png", width=840, height=480)
g <- ggplot(TotalBaltimoreONROAD, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("Year") +
  ylab("Total PM2.5 Emissions") +
  ggtitle("Total PM2.5 Emissions in Baltimore from motor vehicle sources (1999-2008)")
print(g)
dev.off()      
