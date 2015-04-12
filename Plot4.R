consumption = read.table ('household_power_consumption.txt', header = TRUE,sep = ";",quote = "",na.strings = "?", as.is=TRUE)  

# First step is to subset the data just to the days we want to analyze    
plot = subset(consumption, (consumption$Date == "1/2/2007" | consumption$Date== "2/2/2007"))    

# Now I changed the class of the variable "Date" from character to Date:    
plot$Date <- as.Date(plot$Date, format = "%d/%m/%Y")   

# Here I created a new column named "DateTime":  
plot$DateTime <- as.POSIXct(paste(plot$Date, plot$Time))  

# And finaly I'm ready to create the plot
png("plot4.png", width = 480, height = 480) 
par(mfcol=c(2,2))  
plot(plot$DateTime, plot$Global_active_power, type="l", ylab= "Global Active Power", xlab="") 
plot(plot$DateTime, plot$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="") 
lines(plot$DateTime, plot$Sub_metering_2, type="l", col="red") 
lines(plot$DateTime, plot$Sub_metering_3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue")) 
plot(plot$DateTime,plot$Voltage,type="l",ylab="Voltage",xlab="datetime")  
plot(plot$DateTime,plot$Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power") 
dev.off() 
