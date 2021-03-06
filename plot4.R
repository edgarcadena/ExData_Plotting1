#Read entire file into memory
DF <- read.table(file="Data/household_power_consumption.txt", header=TRUE, sep=";", quote="\"", fill=TRUE, comment.char="",colClasses=c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
#Subset data to only include 01-Feb-2007 & 2-Feb-2007
subDF <- DF[DF$Date=="2/2/2007" | DF$Date=="1/2/2007" ,]

#Create timestamp column and append to data frame
timestamp <- strptime(paste(subDF[,"Date"], subDF[,"Time"]),"%d/%m/%Y %H:%M:%S")
subDF <- cbind(timestamp,subDF)

#Open file device and plot chart
png(file="plot4.png",width=480,height=480)
#Set up 2 by 2 panel
par(mfcol=c(2,2))
#Plot first chart
plot(subDF$timestamp,subDF$Global_active_power,type="n",ylab="Global Active Power",xlab="")
lines(subDF$timestamp,subDF$Global_active_power)
#Plot second chart
plot(subDF$timestamp,subDF$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(subDF$timestamp,subDF$Sub_metering_1)
lines(subDF$timestamp,subDF$Sub_metering_2,col="red")
lines(subDF$timestamp,subDF$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty="n",col=c("black","red","blue"),cex=1)
#Plot third chart
plot(subDF$timestamp,subDF$Voltage,type="n",ylab="Voltage",xlab="datetime")
lines(subDF$timestamp,subDF$Voltage)
#Plot fourth chart
plot(subDF$timestamp,subDF$Global_reactive_power,type="n",ylab="Global_reactive_power",xlab="datetime")
lines(subDF$timestamp,subDF$Global_reactive_power)
#Close file device
dev.off()
