setwd("C:/Users/Aman Jaiswal/Desktop/R/Plots/Course project 1/")
library(sqldf)

# reading data into R
power <- read.csv.sql("household_power_consumption.txt", sql = "select * from 
                      file where Date = '1/2/2007' or Date = '2/2/2007'",
                      sep = ";")
power$datetime <- strptime(paste(power$Date, power$Time),
                           format = "%d/%m/%Y %H:%M:%S")

# creating plot in png file
png(filename = "plot4.png")
par(mfrow = c(2,2))
#plot(1,1)
plot(power$datetime, power$Global_active_power, type = "l", lty = 1,
     xlab = "", ylab = "Global Active Power(kilowatts)")
#plot(1,2)
plot(power$datetime, power$Voltage, type = "l", lty = 1,
     xlab = "datetime", ylab = "Voltage")
#plot(2,1)
plot(power$datetime, power$Sub_metering_1, type = "l", lty = 1,
     xlab = "", ylab = "Energy sub metering", col = "black")
lines(power$datetime, power$Sub_metering_2, col = "red")
lines(power$datetime, power$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2",
                              "Sub_metering_3"), lty = 1,
       col = c("black", "red", "blue"), bty = "n")
#plot(2,2)
plot(power$datetime, power$Global_reactive_power, type = "l", lty = 1,
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()