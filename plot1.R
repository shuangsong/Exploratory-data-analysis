setwd("C:/Users/stephanie song/Desktop")

data <- read.table("C:/Users/stephanie song/Desktop/power.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

class(data$Date)

data$Date<-as.Date(data$Date, "%d/%m/%Y")
#subset data that is from 01/02/2007-02/02/2007

subdata<-subset(data, subset=(Date>="2007-02-01" & Date<="2007-02-02" ))

# convert the Date and Time variables to Date/Time classes
date_time<-paste(as.Date(subdata$Date), subdata$Time,"%d/%m/%Y/%H:%M:%S")


subdata$Date_time<-as.POSIXct(date_time)

#create a png file on desktop and define its width, height
png(filename="C:/Users/stephanie song/Desktop/plot1.png",width=480, height=480)


hist(subdata$Global_active_power, main="Global Active Power", xlab="Global Active Power(kilowatts)", ylab="Frequence",col="Red")


dev.off
#close R and check your desktop, there is plot1.R