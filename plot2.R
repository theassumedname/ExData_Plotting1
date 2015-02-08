#generate data.sub
data<-read.table("household_power_consumption.txt",na.strings="?",sep=";",header=T)
data.sub<-data[data[,1]=="1/2/2007"|data[,1]=="2/2/2007" , ]
data.sub$timestamp <- paste(data.sub$Date,data.sub$Time)
data.sub$dt = strptime(data.sub$timestamp, "%d/%m/%Y %H:%M:%S")

#generate line
png("plot2.png")
with(data.sub,plot(dt,Global_active_power,type="l", ylab = "Globak Active Power (kilowatts)",xlab=""))
dev.off()