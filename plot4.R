#Jeff Gauzza
#03/02/2021
#plot4.R

#download and unzip file if it does not already exist in working directory

setwd("C:/Users/Jeff/Desktop/Coursera/Explore/")
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destFile <- "wk1Data.zip"

if (!file.exists(destFile)){download.file(URL, destfile = destFile, mode='wb')}
if (!file.exists("./wk1data")){unzip(destFile)}

#load data to table
data1 <- read.table("./household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE)

#get obs for 2/1/2007 and 2/2//2007
data2 <- data1[data1$Date %in% c("1/2/2007","2/2/2007") ,]

#convert chr to numeric
data2$Global_active_power <- as.numeric(data2$Global_active_power)
data2$Sub_metering_1 <- as.numeric(data2$Sub_metering_1)
data2$Sub_metering_2 <- as.numeric(data2$Sub_metering_2)
data2$Sub_metering_3 <- as.numeric(data2$Sub_metering_3)
data2$Global_reactive_power <- as.numeric(data2$Global_reactive_power)
data2$Voltage <- as.numeric(data2$Voltage)

#add date time as additional column
dt <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data2 <- cbind(data2, dt)

#start plot
png("plot4.png", width=480, height=480)

#make it a 2x2 matrix of graphs
par(mfrow = c(2, 2))

#create graphs

#plot 4a
plot(data2$dt, data2$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#plot 4b
plot(data2$dt, data2$Voltage, type="l", xlab="datetime", ylab="Voltage")

#plot 4c
plot(data2$dt, data2$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data2$dt, data2$Sub_metering_2, type="l", col="red")
lines(data2$dt, data2$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

#plot 4d
plot(data2$dt, data2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#stop output
dev.off()