library(data.table)
library(lubridate)

# fast reading in data (not with read but fread)
# Note that in this dataset missing values are coded as ?
dt <- fread("household_power_consumption.txt", na.strings = "?")

# Only using data from the dates 2007-02-01 and 2007-02-02 -> filter
dt <- dt[dt$Date %in% c("1/2/2007", "2/2/2007") , ]

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png("plot1.png", width = 480, height = 480)

# First plot is a histogram
hist(dt$Global_active_power,
     col = "Red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "frequency")

# close
dev.off()