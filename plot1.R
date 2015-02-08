#generate data.sub
data<-read.table("household_power_consumption.txt",na.strings="?",sep=";",skip=1)
colnames(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data.sub<-data[data[,1]=="1/2/2007"|data[,1]=="2/2/2007" , ]
#generate plot1: hist()
png(file="plot1.png")

hist(data.sub$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")

dev.off()