## Question 2:
## Have total emissions from PM2.5 decreased in the  Baltimore City,
## Maryland (fips == 24510) from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.

## Read the files from your working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## create a subset with data from Baltimore City only
BaltimoreCityEmissions <- NEI[NEI$fips=="24510",]

## calculate the total PM2.5 emissions by year in Baltimore City
TotalEmissionsBaltimoreCity <- aggregate(Emissions ~ year, BaltimoreCityEmissions, sum)

## plot total emissions in Baltimore city by year and print a png file
png("plot2.png")
barplot(height = TotalEmissionsBaltimoreCity$Emissions, main = "Total Baltimore City PM2.5 Emissions by Year", 
        names.arg = TotalEmissionsByYear$year,
        xlab = "Year", 
        ylab = "Total PM2.5 Emissions (in tons)" )
dev.off()
