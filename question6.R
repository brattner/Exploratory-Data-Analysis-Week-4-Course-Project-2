## Question 6:

## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle
## sources in Los Angeles County, California (fips == 06037). 
## Which city has seen greater changes over time in motor vehicle emissions?

## Open ggplot2 package
library(ggplot2)

## Read the files from your working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## create a subset with data from Baltimore City AND generated from motor-vehicles (assuming this means 
## "ON-ROAD" type)
BaltimoreCityEmissionsONROAD <- NEI[NEI$fips=="24510" & NEI$type == "ON-ROAD", ]

## calculate the total emissions in Baltimore from motor vehicles (ON-ROAD)
TotalBaltimoreONROAD <- aggregate(Emissions ~ year, BaltimoreCityEmissionsONROAD, sum)

## create a subset with data from Los Angeles County AND generated from motor-vehicles (assuming this means 
## "ON-ROAD" type)
LAEmissionsONROAD <- NEI[NEI$fips=="06037" & NEI$type == "ON-ROAD", ]

## calculate the total emissions in Los Angeles County from motor vehicles (ON-ROAD)
TotalLAONROAD <- aggregate(Emissions ~ year, LAEmissionsONROAD, sum)

## add a column to each data frame with the city name
TotalBaltimoreONROAD2 <- cbind(TotalBaltimoreONROAD, "City" = rep("Baltimore"))
TotalLAONROAD2 <- cbind(TotalLAONROAD, "City" = rep("LA"))

## combine the data for both cities

TotalBaltimoreLAONROAD <- rbind(TotalBaltimoreONROAD2, TotalLAONROAD2)

## plot total emissions in Baltimore city and Los Angeles County from motor vehicles
## by year  and type and print a png file

png("plot6.png", width=640, height=480)
g <- ggplot(TotalBaltimoreLAONROAD, aes(year, Emissions, col = City))

## add lines
g <- g + geom_line() +
  xlab("Year") +
  ylab("Total PM2.5 Emissions (in tons") +
  ggtitle('Total PM2.5 Emissions in Baltimore City and LA County from Motor Vehicles by Year (1999 to 2008)')
print(g)
dev.off()

