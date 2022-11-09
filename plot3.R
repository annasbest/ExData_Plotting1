library(data.table)
library(lubridate)

# fast reading in data (not with read but fread)
# Note that in this dataset missing values are coded as ?
dt <- fread("household_power_consumption.txt", na.strings = "?")

# Only using data from the dates 2007-02-01 and 2007-02-02 -> filter and convert
dt <- dt[dt$Date %in% c("1/2/2007", "2/2/2007") , ]
dateTime <- dmy_hms(paste(dt$Date, dt$Time, sep = " "), tz = "UTC")

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png("plot3.png", width = 480, height = 480)

# Third plot is a normal plot (analogous to plot2)
plot(dateTime,
     dt$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab="")

# we add additional lines in red and blue colors
lines(dateTime, dt$Sub_metering_2, col = "red")
lines(dateTime, dt$Sub_metering_3, col = "blue")

#before finishing up, we have to add the legend!
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lwd = 1,
       lty = 1)

# close
dev.off()
