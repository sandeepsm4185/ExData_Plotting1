#File with the unzipped data
file<-"household_power_consumption.txt"
#Read the 10000 lines which have the required dates
elec<-read.table(file, header = TRUE, sep = ";", stringsAsFactors =FALSE, skip = 60000, nrows = 10000, na.strings = "?", col.names = c( "Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Filter out data for selected dates
elec1<- elec[elec$Date %in% c("1/2/2007","2/2/2007"),]

#Create png file and plot
png("plot2.png")
date1<-strptime(paste(elec1$Date, elec1$Time), "%d/%m/%Y %H:%M:%S")
plot(date1,elec1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)" ) 
dev.off()