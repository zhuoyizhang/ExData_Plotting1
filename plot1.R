##Load data

## read table from raw file and replace "?" with NA
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

## filter the data from the dates 2007-02-01 and 2007-02-02

d0<-as.Date("2007-02-01","%Y-%m-%d")
d1<-as.Date("2007-02-02","%Y-%m-%d")

data2<-subset(data, as.Date(data$Date,"%d/%m/%Y") >=d0 & as.Date(data$Date,"%d/%m/%Y") <=d1)


## set up the 1 by 1 layout
par(mfrow=c(1,1))

##Making Plot 1
hist(data2$Global_active_power, main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")

##Produce PNG file
dev.copy(png,file="plot1.png",width=480, height=480)
dev.off()




