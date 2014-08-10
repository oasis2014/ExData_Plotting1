library(sqldf)

fpath<-"household_power_consumption.txt"

#read file and load only the required data
DF<-read.csv.sql(fpath, sep=";", sql="select * from file where Date in  ('1/2/2007', '2/2/2007') ")
closeAllConnections()
DF$Date<-strptime(paste(DF$Date,DF$Time), "%d/%m/%Y %H:%M:%S")

#plot
plot(DF$Date, DF$Sub_metering_1, type="l",col = "black", xlab="", ylab="Energy sub metering")
lines(DF$Date, DF$Sub_metering_2, col = "red")
lines(DF$Date, DF$Sub_metering_3, col = "blue")
legend("topright", col = c("blue", "red", "green"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
dev.copy(png, file="plot3.png")
dev.off()