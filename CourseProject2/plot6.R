##Code to produce the sixth plot for Course Project 2.

##Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in 
##Los Angeles County, California (fips == 06037).
##Which city has seen greater changes over time in motor vehicle emissions?

library(ggplot2)

Baltimore<- NEI[(NEI$fips == "24510") & (NEI$type=="ON-ROAD"), ]
LA <- NEI[(NEI$fips == "06037") & (NEI$type=="ON-ROAD"), ]
Baltimore$City <- "Baltimore City, MD"
LA$City <- "Los Angeles, CA"
BaltimoreLA <- rbind(Baltimore, LA)
png(filename="plot6.png", width=480, height=480, units='px')

ggplot(BaltimoreLA, aes(year, Emissions, color = City)) +
  geom_line(stat = "summary", fun.y = "sum") +
  facet_grid(City  ~ ., scales="free") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Total Emissions in Baltimore City and Los Angeles
          from Motor Vehicle Sources from 1999 to 2008")

dev.off()
