#Get the file to read
file <-"household_power_consumption.txt"
# Read the file treat ? as missing data
xf <- read.table(file, na.strings = "?", sep = ";", stringsAsFactors = FALSE,header = TRUE)

xf$DateTime <- paste(xf$Date, xf$Time)
xf$DateTime <- as.Date(xf$DateTime, format = "%d/%m/%Y %H:%M:%S")
library(dplyr)
subsetted <- filter(xf, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))
png("plot1.png", height = 480, width = 480)
hist(subsetted$Global_active_power,main=paste("Global Active Power"), 
     xlab = "Global Active Power (kilowatts)",col = "Red")
dev.off()