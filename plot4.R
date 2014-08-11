library(sqldf)

fpath<-"household_power_consumption.txt"

#read file and load only the required data
DF<-read.csv.sql(fpath, sep=";", sql="select * from file where Date in  ('1/2/2007', '2/2/2007') ")
closeAllConnections()
DF$Date<-strptime(paste(DF$Date,DF$Time), "%d/%m/%Y %H:%M:%S")

#plot
par(mfrow=c(2,2))
plot(DF$Date,DF$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")
plot(DF$Date,DF$Voltage, type="l", xlab="datetime", ylab="Voltage")
with(DF, {
  plot(Date, Sub_metering_1, type="l",col = "black", xlab="", ylab="Energy sub metering")
  lines(Date, Sub_metering_2, col = "red")
  lines(Date, Sub_metering_3, col = "blue")
  legend("topright", col = c("blue", "red", "green"), bty="n",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
})
plot(DF$Date,DF$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png")
dev.off()