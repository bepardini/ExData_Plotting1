consumption = read.table ('household_power_consumption.txt', header = TRUE,sep = ";",quote = "",na.strings = "?", as.is=TRUE) 

# First step is to subset the data just to the days we want to analyze   
plot = subset(consumption, (consumption$Date == "1/2/2007" | consumption$Date== "2/2/2007"))   
   
# Now I changed the class of the variable "Date" from character to Date:   
plot$Date <- as.Date(plot$Date, format = "%d/%m/%Y")  

# Here I created a new column named "DateTime":  
plot$DateTime <- as.POSIXct(paste(plot$Date, plot$Time))  

# Creating the plot
png("plot3.png", width = 480, height = 480) 
plot(plot$DateTime, plot$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="") 
lines(plot$DateTime, plot$Sub_metering_2, type="l", col="red") 
lines(plot$DateTime, plot$Sub_metering_3, type="l", col="blue") 
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty=1, col=c("black", "red", "blue")) 
dev.off()
