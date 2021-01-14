data <- read.table('household_power_consumption.txt', sep=';', header=T, 
                   colClasses = c('character', 'character', 'numeric','numeric',
                                  'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings='?')

data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, (data$Date == "2007-02-01" | data$Date == "2007-02-02"))

par(mfrow=c(1,1))

plot(data$DateTime, data$Sub_metering_1, xlab = "", ylab="Energy sub metering", type = "n")
lines(data$DateTime, data$Sub_metering_1, col = "black")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()