#Get the file to read
# Each of the plotting functions assumes the uncompressed txt file household_power_consumption.txt
#resides in the user working directory
# the user should download the data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# and uncompress into the working directory
# This process was chosen to reduce the overhead of the plotting functions
file <-"household_power_consumption.txt"
# Read the file treat ? as missing data
xf <- read.table(file, na.strings = "?", sep = ";", stringsAsFactors = FALSE,header = TRUE)

xf$DateTime <- paste(xf$Date, xf$Time)
xf$DateTime <- as.Date(xf$DateTime, format = "%d/%m/%Y %H:%M:%S")
library(dplyr)
subsetted <- filter(xf, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))
png("plot1.png", height = 480, width = 480)
hist(subsetted$Global_active_power,main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)",col = "Red")
dev.off()