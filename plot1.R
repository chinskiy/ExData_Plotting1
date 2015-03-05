data <- read.table("household_power_consumption.txt", sep=";", dec=".", header=TRUE,
                  na.strings="?", colClasses=c(rep("character",2), rep("numeric",7)))
data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
png("plot1.png", width = 480, height = 480, bg = "transparent")
hist(data$Global_active_power, main = "Global Active Power", col = "orangered", xlab = "Global Active Power (kilowatts)")
dev.off()