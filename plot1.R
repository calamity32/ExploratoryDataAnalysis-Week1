#Jeff Gauzza
#03/02/2021
#plot1.R

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

#start plot
png("plot1.png", width=480, height=480)

#create histogram
hist(data2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#stop output
dev.off()