##Load data

## read table from raw file and replace "?" with NA
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

## filter the data from the dates 2007-02-01 and 2007-02-02

d0<-as.Date("2007-02-01","%Y-%m-%d")
d1<-as.Date("2007-02-02","%Y-%m-%d")

data2<-subset(data, as.Date(data$Date,"%d/%m/%Y") >=d0 & as.Date(data$Date,"%d/%m/%Y") <=d1)


##connect Date and Time into Datetime
dates<-as.Date(data2[,1], "%d/%m/%Y")
times<-data2[,2]
x <- paste(dates, times)
strptime(x, "%Y-%m-%d %H:%M:%S")
y<-as.POSIXlt(x,"%Y-%m-%d %H:%M:%S",tz="GMT")
##add datetime column into data3
data3<-data2
data3$Datetime<-y

## set up the 1 by 1 layout
par(mfrow=c(1,1))

##Making Plot 3
plot(data3$Datetime, data3$Sub_metering_1, type="n",col="black", ylab="Energy Sub Metering", xlab="")
points(data3$Datetime, data3$Sub_metering_1, type="l",col="black", xlab="")
points(data3$Datetime, data3$Sub_metering_2, type="l",col="red", xlab="")
points(data3$Datetime, data3$Sub_metering_3, type="l",col="blue", xlab="")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


##Produce PNG file
dev.copy(png,file="plot3.png",width=480, height=480,res=45)
dev.off()




