library(sqldf)

fpath<-"household_power_consumption.txt"

#read file and load only the required data
DF<-read.csv.sql(fpath, sep=";", sql="select * from file where Date in  ('1/2/2007', '2/2/2007') ")
closeAllConnections()
DF$Date<-strptime(paste(DF$Date,DF$Time), "%d/%m/%Y %H:%M:%S")

#plot
plot(DF$Date,DF$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")
dev.copy(png, file="plot2.png")
dev.off()