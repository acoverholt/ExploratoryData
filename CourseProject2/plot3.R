##Code to produce the third plot for Course Project 2.

##Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
##which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
##Which have seen increases in emissions from 1999-2008?

library(ggplot2)

Baltimore<- NEI[NEI$fips == "24510", ]
png(filename="plot3.png", width=480, height=480, units='px')

ggplot(baltimore.data, aes(year, Emissions, color = type)) +
  geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Total Emissions in Baltimore City from 1999 to 2008")

dev.off()
