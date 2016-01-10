col_names <- names(read.table("household_power_consumption.txt",
                             nrow=1, header=TRUE, sep=";"))
skip_<- grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"))[1]-1
nrows<- grep("^3/2/2007", readLines("household_power_consumption.txt"))-skip_
EPC<-read.table(file="household_power_consumption.txt",
                   skip=skip_,nrows=nrows[1]-1,sep=";")
names(EPC)<-col_names

png("plot1.png",width = 480,height = 480)
hist(EPC$Global_active_power,main= "Global Active Power",
     xlab = "Global Active Power(kilowatts)",col ="red",fg="black",border="black")
dev.off()
