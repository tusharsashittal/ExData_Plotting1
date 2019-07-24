# Please see the file MemoryCalculationAndDataExtraction.R for code to load the data
# This file contains the source code for generating plot3

par(mfrow=c(1,1)) # one graph per device

# setting the device length to 8 (inches) x 60 (pixels per inch) = 480 pixels
# Same for device width
windows(8, 8, xpinch = 60, ypinch = 60, bg = "white")

# get the device id for the windows screen. Useful while closing it
winID <- dev.cur()

# draw the graph on the windows device
plot(tabAllDF$DateTime ,tabAllDF$Sub_metering_1, main = "", type = "n",
     xlab = "", ylab = "Energy Sub metering")
lines(tabAllDF$DateTime ,tabAllDF$Sub_metering_1, type = "o", cex = 0)
lines(tabAllDF$DateTime ,tabAllDF$Sub_metering_2, type = "o", cex = 0, col = "red")
lines(tabAllDF$DateTime ,tabAllDF$Sub_metering_3, type = "o", cex = 0, col = "blue")

# Add the legend
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Copy the graph to png file
dev.copy(png, file = "plot3.png")

# Get the device id for the png file. Useful while closing it
pngID <- dev.cur()

# Close both the open devices
dev.off(pngID)
dev.off(winID)