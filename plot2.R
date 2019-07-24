# Please see the file MemoryCalculationAndDataExtraction.R for code to load the data
# This file contains the source code for generating plot2

par(mfrow=c(1,1)) # one graph per device

# setting the device length to 8 (inches) x 60 (pixels per inch) = 480 pixels
# Same for device width
windows(8, 8, xpinch = 60, ypinch = 60, bg = "white")

# get the device id for the windows screen. Useful while closing it
winID <- dev.cur()

# Setup the plot on the windows device
plot(tabAllDF$DateTime ,tabAllDF$Global_active_power, main = "", type = "n",
     xlab = "", ylab = "Global Active Power (kilowatts)")

# Draw the data and the line connecting them
lines(tabAllDF$DateTime, tabAllDF$Global_active_power, type = "o", cex = 0)

# Copy the graph to png file
dev.copy(png, file = "plot2.png")

# Get the device id for the png file. Useful while closing it
pngID <- dev.cur()

# Close both the open devices
dev.off(pngID)
dev.off(winID)