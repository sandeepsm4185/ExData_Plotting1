#File with the unzipped data
file<-"household_power_consumption.txt"
#Read the 10000 lines which have the required dates
elec<-read.table(file, header = TRUE, sep = ";", stringsAsFactors =FALSE, skip = 60000, nrows = 10000, na.strings = "?", col.names = c( "Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Filter out data for selected dates
elec1<- elec[elec$Date %in% c("1/2/2007","2/2/2007"),]

#Create png file and plot
png("plot4.png")
date1<-strptime(paste(elec1$Date, elec1$Time), "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2,2))
plot(date1, elec1$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
plot(date1, elec1$Voltage, xlab = "datetime",  ylab = "Voltage", type = "l")
plot(date1,elec1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering" ) 
lines(date1,elec1$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red" ) 
lines(date1,elec1$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue" ) 
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1, bty = "n")
plot(date1, elec1$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
axis(side = 2, at = c(0.1,0.2,0.3,0.4,0.5))
dev.off()