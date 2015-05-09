library(dplyr)

# Read data from file
EPdata <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE)

# Convert date and subsetting 2 days data
EPdata$Date <- as.Date(EPdata$Date, "%d/%m/%Y")
EP2days <- subset(EPdata, Date=="2007-02-01"|Date=="2007-02-02")

x1<-as.numeric(as.character(EP2days$Global_active_power))

#### plot 2
par(mar = c(6,6,2,2), bg="white")
plot(x1, type="l", xlab="", ylab="Global Active Power (kilowatts)", xaxt= 'n')
axis(side =1, at = c(0, 1440, 2880), labels=c("Thu","Fri","Sat"))
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()