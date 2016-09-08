###Reading and subsetting the data (should be in the working directory

elec <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
elec$Date <- as.Date(elec$Date, format = "%d/%m/%Y")
elec <- subset(elec, Date >= "2007-02-01" & Date <= "2007-02-02")

##creating the plot
png(filename = "plot1.png")
with(elec, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()