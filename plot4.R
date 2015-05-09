library(dplyr)

# Read data from file
EPdata <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE)

# Convert date and subsetting 2 days data
EPdata$Date <- as.Date(EPdata$Date, "%d/%m/%Y")
EP2days <- subset(EPdata, Date=="2007-02-01"|Date=="2007-02-02")

### plot 4
par(mfrow = c(2,2), mar = c(8,6,2,2), bg = 'white')

# subplot 1
x1<-as.numeric(as.character(EP2days$Global_active_power))
plot(x1, type="l", xlab="", ylab="Global Active Power", xaxt= 'n')
axis(side =1, at = c(0, 1440, 2880), labels=c("Thu","Fri","Sat"))

# subplot 2
voltage <- as.numeric(as.character(EP2days$Voltage))
plot(voltage, type ="l", xlab="datetime", ylab="Voltage", xaxt = 'n')
axis(side =1, at = c(0, 1440, 2880), labels=c("Thu","Fri","Sat"))

# subplot 3
submetering <- cbind(as.numeric(EP2days$Sub_metering_1), as.numeric(EP2days$Sub_metering_2),as.numeric(EP2days$Sub_metering_3))
plot(submetering[,1], type="l", col="black", xlab="", ylab="Energy sub metering", xaxt='n')
axis(side =1, at = c(0, 1440, 2880), labels=c("Thu","Fri","Sat"))
lines(submetering[,2], col="red")
lines(submetering[,3], col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), legend = c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "), bty='n')

# subplot 4
reactive <- as.numeric(as.character(EP2days$Global_reactive_power))
plot(reactive, type='l', xlab = 'datetime', ylab = 'Global_reactive_power', xaxt = 'n')
axis(side =1, at = c(0, 1440, 2880), labels=c("Thu","Fri","Sat"))

# Save plot to PNG file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()