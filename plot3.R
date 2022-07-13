##downloading file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method="curl")
unzip ("data.zip", exdir = "./")

##formatting the dates
eneg$Date <- as.Date(eneg$Date, format="%d/%m/%Y")

Time <- paste(eneg$Date, eneg$Time)

eneg$Time <- as.POSIXct(enegTime)

##plot3
with(eneg, {
  plot(Sub_metering_1~Time, 
       type="l",
       ylab="Energy sub metering", 
       xlab="", cex=0.8)
  
  lines(Sub_metering_2~Time, col='Red')
  lines(Sub_metering_3~Time, col='Blue')
})

legend("topright", 
       col=c("black", "red", "blue"), 
       lty=1, 
       lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex=0.8,
       pt.cex=0.8)

##exporting as png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
