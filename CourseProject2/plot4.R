##Code to produce the fourth plot for Course Project 2.

##Across the United States, how have emissions from coal 
##combustion-related sources changed from 1999-2008?

library(ggplot2)

png(filename="plot4.png", width=480, height=480, units='px')
coal <- grep("coal", SCC$Short.Name, ignore.case = T)
coal <- SCC[coal, ]
coal.data <- NEI[NEI$SCC %in% coal$SCC, ]
total <- aggregate(Emissions ~ year, coal.data, FUN = "sum")
plot(total, type = "l", xlab = "Year",
     main = "Total Emissions in the United States 
     from Coal Combustion Sources from 1999 to 2008",
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()
