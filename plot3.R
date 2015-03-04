#Get the file to read
# Each of the plotting functions assumes the uncompressed txt file household_power_consumption.txt
# resides in the user working directory
# the user should download the data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# and uncompress into the working directory
# This process was chosen to reduce the overhead of the plotting functions
file <-"household_power_consumption.txt"
# Read the file treat 
xf <- read.table(file, na.strings = "?", sep = ";", stringsAsFactors = FALSE,header = TRUE)

xf$DateTime <- paste(xf$Date, xf$Time)
xf$DateTime <- as.Date(xf$DateTime, format = "%d/%m/%Y %H:%M:%S")
library(dplyr)
subsetted <- filter(xf, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))
png("plot3.png", height = 480, width = 480)
v1 <- c(1,2880,1441)
v2 <- c("Thu","Sat","Fri")
plot(subsetted$Sub_metering_1,ylab = "Energy sub metering", xlab = "", type = "l", xaxt = "n")
lines(subsetted$Sub_metering_2, type="o", pch=46, lty=1, 
      col="Red")
lines(subsetted$Sub_metering_3, type="o", pch=46, lty=1, 
      col="Blue")
axis(1,at= v1, labels = v2)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = c(1,1,1),lwd = c(1,1,1),col = c("black","red","blue"))
dev.off()