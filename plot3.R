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
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")

##Creating the third plot
plot(data$Date_Time, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
  lines(data$Date_Time, data$Sub_metering_2, col="red")
  lines(data$Date_Time, data$Sub_metering_3, col="blue")
  legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
dev.off()