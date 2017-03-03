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
with(subset, {
         plot(Sub_metering_1~datetime, ylab="Energy sub metering", xlab="", type="l")
         lines(Sub_metering_2~datetime, col="Red")
         lines(Sub_metering_3~datetime, col="Blue")
})
legend("topright", col=c("Black", "Red", "Blue"),lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
