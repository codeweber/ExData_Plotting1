#This script creates plot4.png

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

#Open the graphics device
png("plot4.png", width = 480, height = 480)

#Create the plotting grid 2x2 to be filled column wise
par(mfcol = c(2,2)) 

#In order to ensure that all tick labels are shown on the plot, the tick label size 
#and legend label size are set with cex to be 0.75

#Add first plot
plot(dat$datetime, dat$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex.axis = 0.75)

#Add second plot, identical to plot3, but without border on legend
plot(dat$datetime, dat$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col = "black", cex.axis = 0.75)
lines(dat$datetime, dat$Sub_metering_2, col = "red")
lines(dat$datetime, dat$Sub_metering_3, col = "blue")
leg.txt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend = leg.txt, col = c("black", "red", "blue"), lwd = 1, bty = "n", pt.cex = 1, cex = 0.75)

#Add third plot, together with the x-axis label "datetime"
plot(dat$datetime, dat$Voltage, type="l", xlab="datetime", ylab="Voltage", cex.axis = 0.75)

#Add fourth plot, together with the x-axis label "datetime"
plot(dat$datetime, dat$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", cex.axis = 0.75)

#Close the graphics device
dev.off()
