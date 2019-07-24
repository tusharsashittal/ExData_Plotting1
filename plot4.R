# Please see the file MemoryCalculationAndDataExtraction.R for code to load the data
# This file contains the source code for generating plot3

par(mfrow=c(2,2)) # 4 graphs in this device

# get the device id for the windows screen. Useful while closing it
winID <- dev.cur()

# Draw the 1st graph on the windows device
plot(tabAllDF$DateTime ,tabAllDF$Global_active_power, main = "", type = "n",
     xlab = "", ylab = "Global Active Power")
lines(tabAllDF$DateTime ,tabAllDF$Global_active_power, type = "o", cex = 0)

# Draw the 2nd graph on the windows device
plot(tabAllDF$DateTime ,tabAllDF$Voltage, main = "", type = "n",
     xlab = "datetime", ylab = "Voltage")
lines(tabAllDF$DateTime ,tabAllDF$Voltage, type = "o", cex = 0)

# Draw the 3rd graph on the windows device
plot(tabAllDF$DateTime ,tabAllDF$Sub_metering_1, main = "", type = "n",
     xlab = "", ylab = "Energy Sub metering")
lines(tabAllDF$DateTime ,tabAllDF$Sub_metering_1, type = "o", cex = 0)
lines(tabAllDF$DateTime ,tabAllDF$Sub_metering_2, type = "o", cex = 0, col = "red")
lines(tabAllDF$DateTime ,tabAllDF$Sub_metering_3, type = "o", cex = 0, col = "blue")

# Draw the 4th graph on the windows device
plot(tabAllDF$DateTime ,tabAllDF$Global_reactive_power, main = "", type = "n",
     xlab = "datetime", ylab = "Global_reactive_power")
lines(tabAllDF$DateTime ,tabAllDF$Global_reactive_power, type = "o", cex = 0)

# Copy the graph to png file
dev.copy(png, file = "plot4.png")

# Get the device id for the png file. Useful while closing it
pngID <- dev.cur()

# Close both the open devices
dev.off(pngID)
dev.off(winID)