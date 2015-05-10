## Download the zipped file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="./household_power_consumption.zip")

## Extract the raw data file and load it into memory
unzip(zipfile="./household_power_consumption.zip")
data <- read.table(file="./household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

## Filter data to the required dates
dateInclFilter <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))
filteredData   <- data[as.Date(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")) %in% dateInclFilter,]

## Specify the image to be written's properties.
png("plot1.png", width = 480, height = 480)

## Plot the required data
hist(filteredData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Flush the buffered contents to disk.
dev.off()