#read data
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?", dec=".")

#convert to dates
data$Date<-as.Date(data$Date, format="%d/%m/%Y")

#subset for chosen days
subset<-subset(data,Date >= "2007-02-01" & Date <="2007-02-02")

#create date and time combined data
datetime<-paste(subset$Date, subset$Time)
datetime<-as.POSIXct(datetime)
subset$datetime<-datetime

#plot
plot(subset$Global_active_power~subset$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", heigh=480, width=480)
dev.off()


