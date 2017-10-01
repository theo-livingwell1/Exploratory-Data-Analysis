## loading dataset
power_use<- read.csv("D:\\Document\\Supplement\\Data_Sci\\Exp_Data_Analysis\\household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## changing Date variable to Date class
power_use$Date <- as.Date(power_use$Date, format="%d/%m/%Y")

## Selecting some of the data
usage_dates <- subset(power_use, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(power_use)

## Converting dates
datetime <- paste(as.Date(usage_dates$Date), usage_dates$Time)
usage_dates$Datetime <- as.POSIXct(datetime)

## create plot 2
plot(usage_dates$Global_active_power~usage_dates$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()