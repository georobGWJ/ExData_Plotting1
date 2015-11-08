# plot1.R
# Loads in dataset "household_power_consumption.txt",
# subsets the data collected on 2007-02-01 and 2007-02-02,
# creates a histogram of the Global Active Power,
# and exports a 480x480 px png file of the histogram.

# This script assumes that the plot1.R file and the 
# "household_power_consumption.txt" are both in the
# current working directory.

# Load the full dataset
fullData  <- read.csv("household_power_consumption.txt", 
    header = TRUE, sep = ";", na.strings = "?", dec = ".", 
    colClasses = c("character", "character", "numeric", "numeric", 
    "numeric", "numeric", "numeric", "numeric", "numeric"))

# Subset the data for 2007-02-01 and 2007-02-02
subData <- subset(fullData, (Date == "1/2/2007" | Date == "2/2/2007"))

# Open a "png" device
png("plot1.png")

# Plot the graph to the png file
hist(subData$Global_active_power, breaks = 15, 
    main = "Global Active Power", col = "turquoise", 
    xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
    ylim = c(0,1200))

# Close the "png" device
dev.off()
