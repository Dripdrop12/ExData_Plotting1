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
            cex=.5
     )
     plot(DF$DateTime, DF$Global_reactive_power, type="l", xlab="", ylab="Global_reactive_power")
png(file="plot4.png", width=480, height=480)
dev.off()
