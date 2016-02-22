drawPlot1 <- function() {
    # set locale for auto generated labels on graphics (example: day names)
    Sys.setlocale("LC_TIME", "English")    
    
    colClasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric",
                    "numeric", "numeric", "numeric")
    power_data <- read.csv("household_power_consumption.txt", colClasses = colClasses, 
                           sep = ";", na.strings = c("?"))
    
    two_days_data <- power_data[(power_data[,"Date"] == '1/2/2007' | power_data[,"Date"] == '2/2/2007'),]
    
    png("plot1.png", width = 480, height = 480)
    with(two_days_data, hist(Global_active_power, col="red", main = "Global Active Power",
                          xlab = "Global Active Power (kilowatts)", ylab="Frequency"))
    dev.off()
}