library(sqldf)

fpath<-"household_power_consumption.txt"

#read file and load only the required data
DF<-read.csv.sql(fpath, sep=";", sql="select * from file where Date in  ('1/2/2007', '2/2/2007') ")
closeAllConnections()

#plot
hist(DF$Global_active_power, col="red", xlab="Global Active Power(kilowatts)", main="Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()