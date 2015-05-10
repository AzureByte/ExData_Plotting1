## Download raw data and filter to the 2 required days 1st and 2nd of Feb, 2007
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="./household_power_consumption.zip")
unzip(zipfile="./household_power_consumption.zip")
data <- read.table(file="./household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
dateInclFilter <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))
filteredData   <- data[as.Date(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")) %in% dateInclFilter,]

## Specify the image to be written's properties.
png("plot3.png", width = 480, height = 480)

## Plot the required data
plot(y=filteredData$Sub_metering_1,x=filteredData$datetime, type = "n",xlab ="", ylab="Energy sub metering")
lines(y=filteredData$Sub_metering_1,x=filteredData$datetime,col="black")
lines(y=filteredData$Sub_metering_2,x=filteredData$datetime,col="red")
lines(y=filteredData$Sub_metering_3,x=filteredData$datetime,col="blue")
legend("topright",lty="solid",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Flush the buffered contents to disk.
dev.off()