##Code to produce the first plot for Course Project 2.

##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(filename="plot1.png", width=480, height=480, units='px')

total <- aggregate(Emissions ~ year, NEI, FUN = "sum")
plot(total, type = "l", xlab = "Year",
     main = "Total Emissions in the United States from 1999 to 2008",
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()