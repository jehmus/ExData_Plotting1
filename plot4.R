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
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))
with(subset, {
        plot(Global_active_power~datetime, 
             type="l", ylab="Global Active Power (kilowatts", xlab="")
        plot(Voltage~datetime, 
             type="l",ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~datetime, 
             type="l", ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~datetime, col="red")
        lines(Sub_metering_3~datetime, col="blue")
        legend("topright", 
               col=c("black","red","blue"), 
               lty=, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~datetime, type="l", ylab="Global Reactive Power (kilowatts)", xlab="")
})


dev.off()
