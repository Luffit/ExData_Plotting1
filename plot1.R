data <- read.table('household_power_consumption.txt', sep=';', header=T, 
                   colClasses = c('character', 'character', 'numeric','numeric',
                                  'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings='?')

data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, (data$Date == "2007-02-01" | data$Date == "2007-02-02"))

par(mfrow=c(1,1))

hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()