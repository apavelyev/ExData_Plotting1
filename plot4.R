x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", as.is = TRUE, na.strings = "?")
y <- x[x$Date == "1/2/2007" | x$Date == "2/2/2007", ]
y$DateTime <- strptime(paste(y$Date, y$Time), "%d/%m/%Y %H:%M:%S")
png(file = "plot4.png")
par(mfrow = c(2, 2))
plot(y$DateTime, y$Global_active_power, 
     pch = NA, 
     xlab = "", 
     ylab = "Global Active Power") 
lines(y$DateTime, y$Global_active_power)
plot(y$DateTime, y$Voltage, ylab = "Voltage", xlab = "datetime", pch = NA) 
lines(y$DateTime, y$Voltage) 
plot(y$DateTime, y$Sub_metering_1, 
     pch = NA, 
     xlab = "", 
     ylab = "Energy sub metering") 
lines(y$DateTime, y$Sub_metering_1) 
lines(y$DateTime, y$Sub_metering_2, col = 'red')
lines(y$DateTime, y$Sub_metering_3, col = 'blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  
       col = c('black', 'red', 'blue'),
       lty = c(1, 1, 1),
       bty = 'n') 
with(y, plot(DateTime, Global_reactive_power, xlab = 'datetime', pch = NA)) 
with(y, lines(DateTime, Global_reactive_power))
dev.off()
