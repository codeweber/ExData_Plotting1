#This script creates plot3.png

#Read the data into R
dat <- read.table("./household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#Create a column datetime to include the time
dat$datetime <- strptime(paste(dat$Date, dat$Time), format= "%d/%m/%Y %H:%M:%S")

#Convert the Date column into Date format
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

#Restrict the dataset to the dates of interest from the 2007-02-1 to 2007-02-02. 
start_date <- as.Date("2007-02-01")
end_date <- as.Date("2007-02-02")
dat <- dat[dat$Date >= start_date & dat$Date <= end_date, ]

#Create the plot
png("plot3.png", width = 480, height = 480)
plot(dat$datetime, dat$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col = "black")
lines(dat$datetime, dat$Sub_metering_2, col = "red")
lines(dat$datetime, dat$Sub_metering_3, col = "blue")
leg.txt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend = leg.txt, col = c("black", "red", "blue"), lwd = 1)
dev.off()

