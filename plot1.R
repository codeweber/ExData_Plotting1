#This script creates plot1.png

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
png("plot1.png", width = 480, height = 480)
hist(dat$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()
