## Cleaning of data and collecting required dataset
cachefile <- "plot_data.csv"

if (file.exists(cachefile)) {
  dat <- read.csv(cachefile)
  dat$datetime <- strptime(dat$DateTime, "%Y-%m-%d %H:%M:%S")
} else {
  data <- read.table('/Users/Folder/Courseswork/Rcourse/Exploratory Data Analysis/Project 1/household_power_consumption.txt',
               sep = ";", header= TRUE, na.strings = "?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  
  dat <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
  dat$DateTime <- strptime(paste(dat$Date, dat$Time),"%d/%m/%Y %H:%M:%S")
  write.csv(dat,cachefile)
}

# Plotting and saving in png format
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(dat$DateTime, dat$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

