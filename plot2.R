
###Reading and subsetting the data (should be in the working directory

elec <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
elec$DateAndTime <- paste(elec$Date, elec$Time, sep = " ")

elec$DateAndTime <- strptime(elec$DateAndTime, format = "%d/%m/%Y %H:%M:%S")
subset <- subset(elec, DateAndTime >= "2007-02-01" & DateAndTime < "2007-02-03")


##creating the plot
png(filename = "plot2.png")
plot(subset$DateAndTime, subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()