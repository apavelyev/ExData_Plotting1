x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", as.is = TRUE, na.strings = "?")
y <- x[x$Date == "1/2/2007" | x$Date == "2/2/2007", ]
y$DateTime <- strptime(paste(y$Date, y$Time), "%d/%m/%Y %H:%M:%S")
png(file = "plot2.png")
plot(y$DateTime, y$Global_active_power, 
     pch = NA, 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)") 
lines(y$DateTime, y$Global_active_power)
dev.off()
