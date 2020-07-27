setwd("C:/Users/Aman Jaiswal/Desktop/R/Plots/Course project 1/")
library(sqldf)

# reading data into R
power <- read.csv.sql("household_power_consumption.txt", sql = "select * from
                      file where Date = '1/2/2007' or Date = '2/2/2007'",
                      sep = ";")
power$datetime <- strptime(paste(power$Date, power$Time),
                           format = "%d/%m/%Y %H:%M:%S")

# creating plot in png
png(filename = "plot2.png")
plot(power$datetime, power$Global_active_power, type = "l", lty = 1,
     xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()