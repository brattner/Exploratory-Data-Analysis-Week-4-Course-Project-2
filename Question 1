## Question 1:
## Have total emissions from PM2.5 decreased in The US from 1999 to 2008? Using the base plotting
## system, make a plot showing the total PM2.5 emission from all sources for each of the years 
## 1999, 2002, 2005, and 2008.

##Read the files from your working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## Add emissions in each year
TotalEmissionsByYear <- aggregate(Emissions ~ year, NEI, sum)
## Plot total emissions by year and print a png file
png("plot1.png")
barplot(height = TotalEmissionsByYear$Emissions, main = "Total PM2.5 Emissions by year", 
        names.arg = TotalEmissionsByYear$year,
        xlab = "Year", 
        ylab = "Total PM2.5 Emissions (in tons)" )
dev.off()
