## Download raw data and filter to the 2 required days 1st and 2nd of Feb, 2007
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="./household_power_consumption.zip")
unzip(zipfile="./household_power_consumption.zip")
data <- read.table(file="./household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
dateInclFilter <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))
filteredData   <- data[as.Date(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")) %in% dateInclFilter,]

## Specify the image to be written's properties.
png("plot2.png", width = 480, height = 480)

## Plot the required data
filteredData$datetime <- strptime(paste(filteredData$Date, filteredData$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
plot(y=filteredData$Global_active_power, x=filteredData$datetime, ylab="Global Active Power (kilowatts)", xlab="", type="l")

## Flush the buffered contents to disk.
dev.off()