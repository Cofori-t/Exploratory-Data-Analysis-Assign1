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

#Plot4 of subset data
datetime <- strptime(paste(Sub_expData$Date, Sub_expData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
glb_Act_Power <- as.numeric(Sub_expData$Global_active_power)
glb_Rea_Power <- as.numeric(Sub_expData$Global_reactive_power)
volt <- as.numeric(Sub_expData$Voltage)
sub_ring1 <- as.numeric(Sub_expData$Sub_metering_1)
sub_ring2 <- as.numeric(Sub_expData$Sub_metering_2)
sub_ring3 <- as.numeric(Sub_expData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, glb_Act_Power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, volt, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, sub_ring1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_ring2, type="l", col="red")
lines(datetime, sub_ring3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, glb_Rea_Power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
