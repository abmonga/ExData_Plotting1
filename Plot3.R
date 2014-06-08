## Cleaning of data and collecting required dataset
cachefile <- "plot_data3.csv"

if (file.exists(cachefile)) {
  dat <- read.csv(cachefile)
  dat$datetime <- strptime(dat$DateTime, "%Y-%m-%d %H:%M:%S")
} else {
  data <- read.table('/Users/abhishekmonga/Documents/My Folder/Courseswork/Rcourse/Exploratory Data Analysis/Project 1/household_power_consumption.txt',
                     sep = ";", header= TRUE, na.strings = "?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  
  dat <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
  dat$DateTime <- strptime(paste(dat$Date, dat$Time),"%d/%m/%Y %H:%M:%S")
  write.csv(dat,cachefile)
}

# Plotting and saving in png format
cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(dat$DateTime, dat$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dat$DateTime, dat$Sub_metering_2, type="l", col="red")
lines(dat$DateTime, dat$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)

dev.off()