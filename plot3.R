#read the data

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



png(filename = "plot3.png", width = 480, height = 480)

plot(c(data$unixTime,data$unixTime,data$unixTime), c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3), type = "n", ylab = "Energy sub metering", xlab="")
lines(data$unixTime, data$Sub_metering_1, col="black")
lines(data$unixTime, data$Sub_metering_2, col="red")
lines(data$unixTime, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))

dev.off()
