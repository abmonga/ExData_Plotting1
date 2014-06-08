## Cleaning of data and collecting required dataset
cachefile <- "plot_data4.csv"

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
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2),mar = c(4,4,2,1),oma =c(0,0,2,0))

with(dat, {
  plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power", type="l")
  plot(DateTime, Voltage, xlab="datetime", ylab="Voltage", type="l")
  
  cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(DateTime, Sub_metering_2, type="l", col="red")
  lines(DateTime, Sub_metering_3, type="l", col="blue")
  legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols, bty="n")
  
  plot(DateTime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")        
})    
dev.off()