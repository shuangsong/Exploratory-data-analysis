setwd("C:/Users/stephanie song/Desktop")

data <- read.table("C:/Users/stephanie song/Desktop/power.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

class(data$Date)

data$Date<-as.Date(data$Date, "%d/%m/%Y")
#subset data that is from 01/02/2007-02/02/2007

subdata<-subset(data, subset=(Date>="2007-02-01" & Date<="2007-02-02" ))

# convert the Date and Time variables to Date/Time classes
date_time<-paste(as.Date(subdata$Date), subdata$Time,"%d/%m/%Y/%H:%M:%S")


subdata$datetime<-as.POSIXct(date_time)

#create a png file on desktop and define its width, height
#png(filename="C:/Users/stephanie song/Desktop/plot4.png",width=480, height=480)

#make plot in png file
#matplot(subdata$Date_time, cbind("Sub_metering_1","Sub_metering_2","Sub_metering_3"), type="l", xlab="", ylab="Energy sub metering",col=c("black", "red", "blue"))
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))


with(subdata) {

        plot(subdata$Global_active_power~subdata$datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(subdata$Voltage~subdata$datetime, type="l", 
             ylab="Voltage (volt)", xlab="datetime")
        plot(subdata$Sub_metering_1~subdata$datetime, type="l", 
             ylab="Energy sub metering", xlab="")
        lines(subdata$Sub_metering_2~subdata$datetime,col='Red')
        lines(subdata$Sub_metering_3~subdata$datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(subdata$Global_reactive_power~subdata$datetime, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="datetime")
})
## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
#check there is plot4.png on your desktop.
