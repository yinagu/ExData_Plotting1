library(dplyr)

# Read data from file
EPdata <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE)

# Convert date and subsetting 2 days data
EPdata$Date <- as.Date(EPdata$Date, "%d/%m/%Y")
EP2days <- subset(EPdata, Date=="2007-02-01"|Date=="2007-02-02")

#### plot 1
x1<-as.numeric(as.character(EP2days$Global_active_power))
par(mar = c(8,6,2,2), bg = "white")
hist(x1, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()