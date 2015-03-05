data <- read.table("household_power_consumption.txt", sep=";", dec=".", header=TRUE,
                   na.strings="?", colClasses=c(rep("character",2), rep("numeric",7)))
data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
png("plot4.png", width = 480, height = 480, bg = "transparent")
par(mfcol = c(2, 2))
plot(data$Date, data$Global_active_power, xlab ="", ylab ="Global Active Power", type = "l")

plot(data$Date, data$Sub_metering_1, xlab ="", ylab ="Energy sub metering", type = "l")
lines(data$Date, data$Sub_metering_2, col = "red")
lines(data$Date, data$Sub_metering_3, col = "deepskyblue")
legend("topright", col = c("black", "red", "deepskyblue"), lty = c(1, 1), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$Date, data$Voltage, type = "l", xlab ="datetime", ylab = "Voltage")

plot(data$Date, data$Global_reactive_power, type = "l", xlab ="datetime", ylab = "Global_reactive_power")
dev.off()