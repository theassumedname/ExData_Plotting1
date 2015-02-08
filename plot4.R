#generate data.sub
data<-read.table("household_power_consumption.txt",na.strings="?",sep=";",header=T)
data.sub<-data[data[,1]=="1/2/2007"|data[,1]=="2/2/2007" , ]
data.sub$timestamp <- paste(data.sub$Date,data.sub$Time)
data.sub$dt = strptime(data.sub$timestamp, "%d/%m/%Y %H:%M:%S")

png("plot4.png")
par(mfrow = c(2,2))
with(data.sub,plot(dt,Global_active_power,type="l", col = "black", ylab = "Globak Active Power",xlab=""))
with(data.sub,plot(dt,Voltage,type="l", col = "black",ylab = "Voltage",xlab="datetime"))
with(data.sub,plot(dt,Sub_metering_1,type="l", col = "black", ylab = "Energy Sub Meterings",xlab=""))
with(data.sub,lines(dt,Sub_metering_2,type="l", col = "red"))
with(data.sub,lines(dt,Sub_metering_3,type="l", col = "blue"))
legend("topright",col=c("black","red","blue"),lty=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
with(data.sub,plot(dt,Global_reactive_power,type="l", col = "black",ylab = "Global_reactive_power",xlab="datetime"))
dev.off()