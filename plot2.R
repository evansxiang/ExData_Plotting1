data = read.delim("./household_power_consumption.txt", sep=";", na.strings="?")
data$datetime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date = as.Date(data$Date, "%d/%m/%Y")
beginDate = as.Date("2007-02-01")
endDate = as.Date("2007-02-02")
data = data[(data$Date >= beginDate) & (data$Date <= endDate), ]
plot(data$datetime, data$Global_active_power, xlab="", ylab = "Global Active Power (kilowatts)", type="l")
dev.copy(png, "plot2.png")
dev.off()