###Reading and subsetting the data (should be in the working directory

elec <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
elec$DateAndTime <- paste(elec$Date, elec$Time, sep = " ")

elec$DateAndTime <- strptime(elec$DateAndTime, format = "%d/%m/%Y %H:%M:%S")
subset <- subset(elec, DateAndTime >= "2007-02-01" & DateAndTime < "2007-02-03")


##creating the plot
png(filename = "plot3.png")
plot(subset$DateAndTime, subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(subset$DateAndTime, subset$Sub_metering_2, col = "red")
lines(subset$DateAndTime, subset$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty = c(1,1,1))
dev.off()