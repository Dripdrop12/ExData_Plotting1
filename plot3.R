# Read in the date #
DF <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings="?",stringsAsFactors=FALSE)

# Format the date and time variable and subset the dataset #
DF <- tbl_df(DF)
DF$Date <- as.Date(DF$Date, format="%d/%m/%Y")
DF$DateTime <- format(as.POSIXct(paste(DF$Date, DF$Time)), "%d/%m/%Y %H:%M:%S")
DF$DateTime <- strptime(DF$DateTime, format="%d/%m/%Y %H:%M:%S")
DF <- subset(DF, Date=="2007-02-02"|Date=="2007-02-01")

# Plot 3 #
plot(DF$DateTime,DF$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
with(DF,lines(DateTime,Sub_metering_2,col="red"))
with(DF,lines(DateTime,Sub_metering_3,col="blue"))
legend(x = "topright",
       y= "topright", 
       lty=c(1,1),
       col=c("black","red","blue"),
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
)