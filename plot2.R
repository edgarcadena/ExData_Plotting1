#Read entire file into memory
DF <- read.table(file="Data/household_power_consumption.txt", header=TRUE, sep=";", quote="\"", fill=TRUE, comment.char="",colClasses=c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
#Subset data to only include 01-Feb-2007 & 2-Feb-2007
subDF <- DF[DF$Date=="2/2/2007" | DF$Date=="1/2/2007" ,]

#Create timestamp column and append to data frame
timestamp <- strptime(paste(subDF[,"Date"], subDF[,"Time"]),"%d/%m/%Y %H:%M:%S")
subDF <- cbind(timestamp,subDF)

#Open file device and plot chart
png(file="plot2.png",width=480,height=480)
plot(subDF$timestamp,subDF$Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(subDF$timestamp,subDF$Global_active_power)
#close file device
dev.off()


