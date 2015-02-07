#Plot1.R
#Histogram of global active power

#Read the data into R
dat <- read.table("./household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#Create a column datetime to include the time
dat$datetime <- strptime(paste(dat$Date, dat$Time), format= "%d/%m/%Y %H:%M:%S")

#Convert the Date column into Date format
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

#We are interested in data from the 2007-02-1 and 2007-02-02.
start_date <- as.Date("2007-02-01")
end_date <- as.Date("2007-02-02")

#Restrict the dataset to the dates of interest
dat <- dat[dat$Date >= start_date & dat$Date <= end_date, ]

#Now create the first plot
png("plot1.png", width = 480, height = 480)
hist(dat$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()

#Create the second plot
png("plot2.png", width = 480, height = 480)
plot(dat$datetime, dat$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(dat$datetime, dat$Global_active_power)
dev.off()

#Create the third plot
png("plot3.png", width = 480, height = 480)
plot(dat$datetime, dat$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(dat$datetime, dat$Sub_metering_1, col = "black")
lines(dat$datetime, dat$Sub_metering_2, col = "red")
lines(dat$datetime, dat$Sub_metering_3, col = "blue")
leg.txt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend = leg.txt, col = c("black", "red", "blue"), lwd = 1)
dev.off()

#Create the fourth plot
par(mfcol = c(2,2))
plot(dat$datetime, dat$Global_active_power, type="n", xlab="", ylab="Global Active Power")
lines(dat$datetime, dat$Global_active_power)

plot(dat$datetime, dat$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(dat$datetime, dat$Sub_metering_1, col = "black")
lines(dat$datetime, dat$Sub_metering_2, col = "red")
lines(dat$datetime, dat$Sub_metering_3, col = "blue")
leg.txt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend = leg.txt, col = c("black", "red", "blue"), lwd = 1)
?legend

plot(dat$datetime, dat$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(dat$datetime, dat$Voltage)

plot(dat$datetime, dat$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(dat$datetime, dat$Global_reactive_power)
