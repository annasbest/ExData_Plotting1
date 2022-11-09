library(data.table)
library(lubridate)

# fast reading in data (not with read but fread)
# Note that in this dataset missing values are coded as ?
dt <- fread("household_power_consumption.txt", na.strings = "?")

# Only using data from the dates 2007-02-01 and 2007-02-02 -> filter and convert
dt <- dt[dt$Date %in% c("1/2/2007", "2/2/2007") , ]
dateTime <- dmy_hms(paste(dt$Date, dt$Time, sep = " "), tz = "UTC")

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png("plot2.png", width = 480, height = 480)

# Second plot is a normal plot
plot(dateTime,
     dt$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab="")

# close
dev.off()
