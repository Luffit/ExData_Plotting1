data <- read.table('household_power_consumption.txt', sep=';', header=T, 
                   colClasses = c('character', 'character', 'numeric','numeric',
                                  'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings='?')

data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, (data$Date == "2007-02-01" | data$Date == "2007-02-02"))

par(mfcol=c(2,2), mar=c(4, 4, 2, 1))

plot(data$DateTime, data$Global_active_power, xlab = "", ylab="Global Active Power (kilowatts)", type = "n")
lines(data$DateTime, data$Global_active_power)

plot(data$DateTime, data$Sub_metering_1, xlab = "", ylab="Energy sub metering", type = "n")
lines(data$DateTime, data$Sub_metering_1, col = "black")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, box.lty = 0)

plot(data$DateTime, data$Voltage, xlab = "datetime", ylab="Voltage", type = "n")
lines(data$DateTime, data$Voltage)

plot(data$DateTime, data$Global_reactive_power, xlab = "datetime", ylab="Global_reactive_power", type = "n")
lines(data$DateTime, data$Global_reactive_power)

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()