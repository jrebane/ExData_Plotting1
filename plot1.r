# Loading the data
data <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Converting the dates/times to DateTime
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# Subsetting the dataframe
datasub <- subset(data, data$DateTime >= as.POSIXct('2007-02-01 00:00') & 
                          data$DateTime < as.POSIXct('2007-02-03 00:00'))

# Plotting the chart
hist(datasub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Copying the chart output to a PNG file
dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off()