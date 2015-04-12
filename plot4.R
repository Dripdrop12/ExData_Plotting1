# Read in the date #
DF <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings="?",stringsAsFactors=FALSE)

# Format the date and time variable and subset the dataset #
DF <- tbl_df(DF)
DF$Date <- as.Date(DF$Date, format="%d/%m/%Y")
DF$DateTime <- format(as.POSIXct(paste(DF$Date, DF$Time)), "%d/%m/%Y %H:%M:%S")
DF$DateTime <- strptime(DF$DateTime, format="%d/%m/%Y %H:%M:%S")
DF <- subset(DF, Date=="2007-02-02"|Date=="2007-02-01")

# Plot 4 #
png(file="plot4.png", width=640, height=640)
par(mfrow = c(2, 2))
     plot(DF$DateTime, DF$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
     plot(DF$DateTime, DF$Voltage, type="l", xlab="", ylab="Voltage")
     plot(DF$DateTime, DF$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
     lines(DF$DateTime, DF$Sub_metering_2, col="red")
     lines(DF$DateTime, DF$Sub_metering_3, col="blue")
     legend("topright",
            col=c("black","red","blue"),
            legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),                       
            lty=c(1,1),bty="n", 
            cex=1
     )
     plot(DF$DateTime, DF$Global_reactive_power, type="l", xlab="", ylab="Global_reactive_power")

# Saving Plot 4 as a png #

dev.off()
