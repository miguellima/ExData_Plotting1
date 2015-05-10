# Read File
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",stringsAsFactors=FALSE)

# create date time column
data$DateTime <- as.POSIXct(strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S"))

# Convert Date column
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subsetting the data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#initialize device

png("plot3.png", width=480, height=480)

# Plot 3
with(data, {
  plot(Sub_metering_1~DateTime, type="l",
       ylab="Energy Submetering", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2.5, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# close dev
dev.off()