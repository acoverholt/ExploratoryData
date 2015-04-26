##Loading the Data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

##Converting the first column into date format
data[,1] <- as.Date(as.character(data[,1]), "%d/%m/%Y")

##subsetting the data into the specified dates (2-1-2007 and 2-2-2007)
data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

##Create Date_Time variable
data$Date_Time <- paste(data$Date, data$Time)

# Convert Date_Time variable to proper format
data$Date_Time <- strptime(data$Date_Time, format="%Y-%m-%d %H:%M:%S")

##Converting the other columns into numeric format
for (i in c(3:9)) {data[,i] <- as.numeric(as.character(data[,i]))}

##Save plot as png
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")

##Creating the second plot
plot(data[,c(10,3)], type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()