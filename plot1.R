##downloading file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method="curl")
unzip ("data.zip", exdir = "./")



##read data
eneg_full <- read.table("household_power_consumption.txt",
                        header=TRUE, 
                        na.strings="?", 
                        sep=";")

##extracting the wanted dates
eneg <- eneg_full[(eneg_full$Date=="1/2/2007" | eneg_full$Date=="2/2/2007" ), ]

##plot1
hist(eneg$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red")

##exporting as png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()








