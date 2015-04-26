##Code to produce the second plot for Course Project 2.

##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == 24510) from 1999 to 2008? 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(filename="plot2.png", width=480, height=480, units='px')
Baltimore <- NEI[NEI$fips=="24510",]
total <- aggregate(Emissions ~ year, Baltimore, FUN = "sum")
plot(total, type = "l", xlab = "Year",
     main = "Total Emissions in Baltimore City, Maryland from 1999 to 2008",
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()