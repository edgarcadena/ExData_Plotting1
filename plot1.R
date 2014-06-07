#Read entire file into memory
DF <- read.table(file="Data/household_power_consumption.txt", header=TRUE, sep=";", quote="\"", fill=TRUE, comment.char="",colClasses=c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
#Subset data frame to only include 01-Feb-2007 & 2-Feb-2007 data
subDF <- DF[DF$Date=="2/2/2007" | DF$Date=="1/2/2007" ,]

#Open file device and plot chart
png(file="plot1.png",width=480,height=480)
hist(subDF[,"Global_active_power"], col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#close file device
dev.off()

