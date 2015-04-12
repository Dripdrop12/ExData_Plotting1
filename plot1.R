# Read in the data #
DF <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings="?",stringsAsFactors=FALSE)

# Format the date and time variable and subset the dataset #
DF$Date <- as.Date(DF$Date, format="%d/%m/%Y")
DF <- subset(DF, Date=="2007-02-02"|Date=="2007-02-01")

# Plot 1 #
png(file="plot1.png", width=480, height=480)
hist(DF$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power"
)

# Saving Plot 1 as a png #
dev.off()