# Read file
setwd("/Users/juancarlosrodriguezrojo/WorkDoc/2015/Z_CURSOS/JOHNS_HOPKINS_Exploratory Data Analysis/Data")
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "NA")

# Subset from the dates 2007-02-01 and 2007-02-02
hpc2 <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")

# Recode "?" to "NA"
hpc2$Global_active_power[hpc2$Global_active_power == "?"] <- "NA"
hpc2$Global_reactive_power[hpc2$Global_reactive_power == "?"] <- "NA"
hpc2$Voltage[hpc2$Voltage == "?"] <- "NA"
hpc2$Global_intensity[hpc2$Global_intensity == "?"] <- "NA"
hpc2$Sub_metering_1[hpc2$Sub_metering_1 == "?"] <- "NA"
hpc2$Sub_metering_2[hpc2$Sub_metering_2 == "?"] <- "NA"
hpc2$Sub_metering_3[hpc2$Sub_metering_3 == "?"] <- "NA"

# Convert the Date an Time variables to Date/Time classes in R 
library(lubridate)
hpc2$DateTime <- paste(hpc2$Date, hpc2$Time)
hpc2$DateTime1 <- dmy_hms(hpc2$DateTime)

# Plot 3
plot(hpc2$DateTime1, as.numeric(as.character(hpc2$Sub_metering_1)), 
     type = "l", col = "black", 
     xlab = "", ylab = "Energy sub metering")
lines(hpc2$DateTime1, as.numeric(as.character(hpc2$Sub_metering_2)), 
      col = "red")
lines(hpc2$DateTime1, as.numeric(hpc2$Sub_metering_3), col = "blue")
legend("topright", pch = "_", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Device
dev.copy(png, file = "plot3.png", width = 480, height = 480) 
dev.off() 
