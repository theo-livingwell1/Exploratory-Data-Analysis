## load/import household_power_consumption data into r
consumption <- read.table("D:\\Document\\Supplement\\Data_Sci\\Exp_Data_Analysis\\household_power_consumption.txt",
                          header = T, sep = ";", na.strings = "?")

## explore the data
head(consumption)
tail(consumption)
str(consumption)

##convert the date variable (was  of the type Factor) to Date class
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")

## select 2007-02-01 to 2007-02-02 time periods
consumption <- subset(consumption, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# changing dates and times format
consumption$datetime <- strptime(paste(consumption$Date, consumption$Time), "%Y-%m-%d %H:%M:%S")

##plot1
attach(consumption)
hist(Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "blue")

## save graph
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(consumption)
