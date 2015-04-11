consumption = read.table ('household_power_consumption.txt', header = TRUE,sep = ";",quote = "",na.strings = "?", as.is=TRUE)

# First step is to subset the data just to the days we want to analyze  
plot = subset(consumption, (consumption$Date == "1/2/2007" | consumption$Date== "2/2/2007"))  
 
# Now I changed the class of the variable "Date" from character to Date:  
plot$Date <- as.Date(plot$Date, format = "%d/%m/%Y") 

# Plotting and saving it: 
png("plot1.png", width = 480, height = 480) 
hist(plot$Global_active_power, type="l", main="Global Active Power",col='red',ylab= "Frequency", xlab="Global Active Power(kilowatts)") 
dev.off() 
