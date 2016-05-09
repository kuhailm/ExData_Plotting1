# read the data

rawData <- read.csv(
  "track 4\\household_power_consumption.txt", 
  sep=";", 
  dec=".", 
  na.strings = "?", 
  colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
)

#extract the relevant data

data <- rawData[(rawData$Date == "1/2/2007" | rawData$Date == "2/2/2007"), ]
data$unixTime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")


png(filename = "plot2.png", width = 480, height = 480)

plot(data$unixTime, data$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab="")
lines(data$unixTime, data$Global_active_power)

dev.off()
