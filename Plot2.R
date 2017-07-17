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

#Plot2 of subset data
datetime <- strptime(paste(Sub_expData$Date, Sub_expData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
glb_Act_Power1 <- as.numeric(Sub_expData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, glb_Act_Power1, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
