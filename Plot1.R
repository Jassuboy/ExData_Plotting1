setwd("C:/Users/Aman Jaiswal/Desktop/R/Plots/Course project 1/")
library(sqldf)

# reading data into R
power <- read.csv.sql("household_power_consumption.txt", sql = "select * from
                      file where Date = '1/2/2007' or Date = '2/2/2007'",
                      sep = ";")
# creating plot in png
png(filename = "plot1.png")
hist(power$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power(kilowatts)", col = "red")
dev.off()