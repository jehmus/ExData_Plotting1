#read data
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?", dec=".")

#convert to dates
data$Date<-as.Date(data$Date, format="%d/%m/%Y")

#subset for chosen days
subset<-subset(data,Date >= "2007-02-01" & Date <="2007-02-02")

#print to screen
hist(subset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#print to png
dev.copy(png, file="plot1.png", heigh=480, width=480)
dev.off()

