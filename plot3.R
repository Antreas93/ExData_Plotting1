col_names <- names(read.table("household_power_consumption.txt",
                              nrow=1, header=TRUE, sep=";"))
skip_<- grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"))[1]-1
nrows<- grep("^3/2/2007", readLines("household_power_consumption.txt"))-skip_
EPC<-read.table(file="household_power_consumption.txt",
                skip=skip_,nrows=nrows[1]-1,sep=";")
names(EPC)<-col_names

library(dplyr)
Date_Time<-strptime(paste(EPC$Date,EPC$Time,sep=" "),
                    "%d/%m/%Y %H:%M:%S")

png("plot3.png",width = 480,height = 480)
plot(Date_Time,EPC$Sub_metering_1,
     type="l",ylab = "Energy sub metering",xlab = "")
lines(Date_Time,EPC$Sub_metering_2,col="red",type ="l")
lines(Date_Time,EPC$Sub_metering_3,col="blue",type ="l")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,lwd=2,col=c("black","red","blue"))
dev.off()