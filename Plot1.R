
## Cleaning Data
data = fread('/Users/abhishekmonga/Documents/My Folder/Courseswork/Rcourse/Exploratory Data Analysis/Project 1/household_power_consumption.txt',
                  sep = ";", header= TRUE, na.strings = "?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

dat <- data[(data$Date == "1/2/2007" | data$Date == '2/2/2007'),]  # Subsets data for the required dates
activepower <- as.numeric(dat$Global_active_power)

with(faithful, plot(eruptions, waiting))

# Plotting Histogram and saving in png format
hist(activepower, main ="Global Active Power",  xlab="Global Active Power (kilowatts)", col="red")

dev.copy(png, file = 'plot1.png',width = 480, height = 480, units = "px")
dev.off()