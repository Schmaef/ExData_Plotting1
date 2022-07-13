##downloading file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method="curl")
unzip ("data.zip", exdir = "./")

##formatting the dates
eneg$Date <- as.Date(eneg$Date, format="%d/%m/%Y")

Time <- paste(eneg$Date, eneg$Time)

eneg$Time <- as.POSIXct(enegTime)

##plot2
plot(eneg$Global_active_power~eneg$Time, 
     type="l", 
     ylab="Global Active Power (kilowatts)", 
     xlab="",
     cex.lab=0.8,
     cex.axis=0.8)

##exporting as png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
