data = read.delim("./household_power_consumption.txt", sep=";", na.strings="?")
data$datetime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date = as.Date(data$Date, "%d/%m/%Y")
beginDate = as.Date("2007-02-01")
endDate = as.Date("2007-02-02")
data = data[(data$Date >= beginDate) & (data$Date <= endDate), ]

par(mfrow=c(2,2))
plot(data$datetime, data$Global_active_power, xlab="", ylab = "Global Active Power", type="l")
with(data, plot(datetime, Voltage, type="l"))
plot(data$datetime, data$Sub_metering_1, xlab="", ylab="Energy sub metering", col="black", type="l")
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
with(data, plot(datetime, Global_reactive_power, type="l"))

dev.copy(png, "plot4.png")
dev.off()