# plot2.R
# Loads in dataset "household_power_consumption.txt",
# subsets the data collected on 2007-02-01 and 2007-02-02,
# parses the dates and times into a single DateTime
# variable, creates a line plot of the Global Active Power vs. Time
# and exports a 480x480 px png file of this plot.

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

# Convert Dates to the Date class
subData$Date  <- as.Date(subData$Date, format = "%d/%m/%Y")

# Create unique Timestamps for each observation, these go in a new column
subData  <- within(subData, { Timestamp=format(as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S") })

# These timestamps are Character class, so here I turn them back into Date class
subData$Timestamp  <- strptime(subData$Timestamp, "%d/%m/%Y %H:%M:%S")

# Open a "png" device
png("plot2.png")

# Plot the graph to the png file
plot(subData$Timestamp, subData$Global_active_power, type="l",
    main = "Global Active Power vs. Time", xlab = "",
    ylab = "Global Active Power (kilowatts)")

# Close the "png" device
dev.off()
