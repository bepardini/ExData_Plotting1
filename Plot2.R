consumption = read.table ('household_power_consumption.txt', header = TRUE,sep = ";",quote = "",na.strings = "?", as.is=TRUE) 

# First step is to subset the data just to the days we want to analyze   
plot = subset(consumption, (consumption$Date == "1/2/2007" | consumption$Date== "2/2/2007"))   
 
# Now I changed the class of the variable "Date" from character to Date:   
plot$Date <- as.Date(plot$Date, format = "%d/%m/%Y")  

# Here I created a new column named "DateTime": 
plot$DateTime <- as.POSIXct(paste(plot$Date, plot$Time)) 
 
# Creating the plot2: 
png("plot2.png", width = 480, height = 480) 
plot(plot$DateTime, plot$Global_active_power, type="l", ylab= "Global Active Power(kilowatts)", xlab="") 
dev.off() 
