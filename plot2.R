# Read in the date #
DF <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings="?",stringsAsFactors=FALSE)

# Format the date and time variable and subset the dataset #
DF$Date <- as.Date(DF$Date, format="%d/%m/%Y")
DF$DateTime <- format(as.POSIXct(paste(DF$Date, DF$Time)), "%d/%m/%Y %H:%M:%S")
DF$DateTime <- strptime(DF$DateTime, format="%d/%m/%Y %H:%M:%S")
DF <- subset(DF, Date=="2007-02-02"|Date=="2007-02-01")

# Plot 2 #
png(file="plot2.png", width=480, height=480)
plot(DF$DateTime,DF$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

# Saving Plot 2 as a png #

dev.off()