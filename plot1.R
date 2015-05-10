# Read File
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",stringsAsFactors=FALSE)

# create date time column
data$DateTime <- as.POSIXct(strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S"))

# Convert Date column
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subsetting the data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


# Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# copy to png
dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()
