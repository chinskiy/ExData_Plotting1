data <- read.table("household_power_consumption.txt", sep=";", dec=".", header=TRUE,
                   na.strings="?", colClasses=c(rep("character",2), rep("numeric",7)))
data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width = 480, height = 480, bg = "transparent")
plot(data$Date, data$Global_active_power, xlab ="", ylab ="Energy sub metering", type = "l")
dev.off()