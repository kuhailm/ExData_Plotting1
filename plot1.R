

#read the data

rawData <- read.csv(
  "track 4\\household_power_consumption.txt",
  sep=";",
  dec=".",
  na.strings = "?",
  colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
)

#extract the relevant data only

data <- rawData[(rawData$Date == "1/2/2007" | rawData$Date == "2/2/2007"), ]

#save it in a png file

png(filename = "plot1.png", width = 480, height = 480)

#draw a histogram

hist(data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
