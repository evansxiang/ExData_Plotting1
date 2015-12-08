data = read.delim("./household_power_consumption.txt", sep=";", na.strings="?")
data$datetime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date = as.Date(data$Date, "%d/%m/%Y")
beginDate = as.Date("2007-02-01")
endDate = as.Date("2007-02-02")
data = data[(data$Date >= beginDate) & (data$Date <= endDate), ]
hist(data$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.copy(png, "plot1.png")
dev.off()