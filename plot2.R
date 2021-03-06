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
png("plot2.png",width = 480,height = 480)
plot(x=Date_Time,y=EPC$Global_active_power,xlab=" ",
     lty=1,ylab = "Global Active Power(kilowatts)",type="l")
dev.off()