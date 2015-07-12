x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", as.is = TRUE, na.strings = "?")
y <- x[x$Date == "1/2/2007" | x$Date == "2/2/2007", ]
y$DateTime <- strptime(paste(y$Date, y$Time), "%d/%m/%Y %H:%M:%S")
png(file = "plot3.png")
plot(y$DateTime, y$Sub_metering_1, 
     pch = NA, 
     xlab = "", 
     ylab = "Energy sub metering") 
lines(y$DateTime, y$Sub_metering_1) 
lines(y$DateTime, y$Sub_metering_2, col = 'red')
lines(y$DateTime, y$Sub_metering_3, col = 'blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1), 
       col = c('black', 'red', 'blue')) 
dev.off()
