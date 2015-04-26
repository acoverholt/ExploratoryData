##Code to produce the fifth plot for Course Project 2.

##How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(filename="plot5.png", width=480, height=480, units='px')
BaltimoreMV <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
total <- aggregate(Emissions ~ year, BaltimoreMV, FUN = "sum")
plot(total, type = "l", xlab = "Year",
     main = "Total Emissions in Baltimore City, Maryland 
     for all Motor Vehicle sources from 1999 to 2008",
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()