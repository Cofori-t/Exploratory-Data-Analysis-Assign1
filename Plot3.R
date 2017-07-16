getwd()
setwd("C:\\Users\\charles\\Desktop\\couseras")
setwd("C:\\Users\\charles\\Desktop\\couseras\\course2")
#Downloading  in 
if(!file.exists("expl_data")) dir.create("expl_data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./expl_data/household_power_consumption.zip")
unzip("./expl_data/household_power_consumption.zip", exdir = "./expl_data")

dataFile <- "./expl_data/household_power_consumption.txt"
expdata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Sub_expData <- data[expdata$Date %in% c("1/2/2007","2/2/2007") ,]



#Plot3 of subset data
globalActivePower <- as.numeric(Sub_expData$Global_active_power)
sub_ring1 <- as.numeric(Sub_expData$Sub_metering_1)
sub_ring2 <- as.numeric(Sub_expData$Sub_metering_2)
sub_ring3 <- as.numeric(Sub_expData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, sub_ring1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_ring2, type="l", col="red")
lines(datetime, sub_ring3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()