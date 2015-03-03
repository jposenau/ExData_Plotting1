#Get the file to read
file <-"household_power_consumption.txt"
# Read the file treat ? as missing data
xf <- read.table(file, na.strings = "?", sep = ";", stringsAsFactors = FALSE,header = TRUE)

xf$DateTime <- paste(xf$Date, xf$Time)
xf$DateTime <- as.Date(xf$DateTime, format = "%d/%m/%Y %H:%M:%S")
library(dplyr)
subsetted <- filter(xf, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))
png("plot4.png", height = 480, width = 480)
par(mfrow=c(2,2))
v1 <- c(1,2880,1460)
v2 <- c("Thu","Sat","Fri")
plot(subsetted$Global_active_power,ylab = "Global Active Power", xlab = "", type = "l", xaxt = "n")
axis(1,at= v1, labels = v2)
plot(subsetted$Voltage,ylab = "Voltage", 
     xlab = "datetime", type = "l", xaxt = "n")
axis(1,at= v1, labels = v2)
plot(subsetted$Sub_metering_1,ylab = "Energy sub metering", xlab = "", type = "l", xaxt = "n")
lines(subsetted$Sub_metering_2, type="o", pch=46, lty=1, 
      col="Red")
lines(subsetted$Sub_metering_3, type="o", pch=46, lty=1, 
      col="Blue")
axis(1,at= v1, labels = v2)
legend("topright",c("Submetering_1","Submetering_2","Submetering_3"), 
       lty = c(1,1,1),lwd = c(1,1,1),col = c("black","red","blue"), bty = "n")
plot(subsetted$Global_reactive_power,ylab = "Global_Reactive_Power", xlab = "datetime", 
     type = "l", xaxt = "n")
axis(1,at= v1, labels = v2)
dev.off()