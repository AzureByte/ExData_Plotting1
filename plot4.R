## Download raw data and filter to the 2 required days 1st and 2nd of Feb, 2007
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="./household_power_consumption.zip")
unzip(zipfile="./household_power_consumption.zip")
data <- read.table(file="./household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
dateInclFilter <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))
filteredData   <- data[as.Date(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")) %in% dateInclFilter,]
filteredData$datetime <- strptime(paste(filteredData$Date, filteredData$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

## Specify the image to be written's properties.
png("plot4.png", width = 480, height = 480)

## Plot the required data

#  Specify the SubPlots
par(mfcol=c(2,2))

## Plot the first subplot
plot(y=filteredData$Global_active_power, x=filteredData$datetime, ylab="Global Active Power (kilowatts)", xlab="", type="l")

## Plot the second subplot
plot(y=filteredData$Voltage, x=filteredData$datetime, ylab="Voltage", xlab="datetime", type="l")

## Plot the third subplot
plot(y=filteredData$Sub_metering_1,x=filteredData$datetime, type = "n",xlab ="", ylab="Energy sub metering")
lines(y=filteredData$Sub_metering_1,x=filteredData$datetime,col="black")
lines(y=filteredData$Sub_metering_2,x=filteredData$datetime,col="red")
lines(y=filteredData$Sub_metering_3,x=filteredData$datetime,col="blue")
legend("topright",bty="n",lty="solid", col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Plot the fourth subplot
plot(filteredData$Global_reactive_power, x=filteredData$datetime, ylab="datetime",xlab="Global_reactive_power", type="l")

## Flush the buffered contents to disk.
dev.off()