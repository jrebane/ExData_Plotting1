# Loading the data
data <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Converting the dates/times to DateTime
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# Subsetting the dataframe
datasub <- subset(data, data$DateTime >= as.POSIXct('2007-02-01 00:00') & 
                          data$DateTime < as.POSIXct('2007-02-03 00:00'))

# Loading the graphics package
png(file="plot4.png", width=480, height=480)

# Setting the stage for four plots
par(mfrow = c(2,2))

# Plot #1 (Upper Left): Global Active Power by DateTime
plot(datasub$DateTime, datasub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Plot #2 (Upper Right): Voltage by DateTime
plot(datasub$DateTime, datasub$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Plot #3 (Lower Left): Energy sub metering by DateTime
plot(datasub$DateTime, datasub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datasub$DateTime, datasub$Sub_metering_2, col = "red")
lines(datasub$DateTime, datasub$Sub_metering_3, col = "blue")
legend("topright",lty=c(1,1,1),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black","red","blue"), pt.cex=1, cex=1, xjust = 1, bty = "n")

# Plot #4 (Lower Right): Global Reactive Power by DateTime
plot(datasub$DateTime, datasub$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# Turning off the graphics package
dev.off()