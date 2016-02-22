drawPlot3 <- function() {
    # set locale for auto generated labels on graphics (example: day names)
    Sys.setlocale("LC_TIME", "English")    
    
    colClasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric",
                    "numeric", "numeric", "numeric")
    power_data <- read.csv("household_power_consumption.txt", colClasses = colClasses, 
                           sep = ";", na.strings = c("?"))
    
    two_days_data <- power_data[(power_data[,"Date"] == '1/2/2007' | power_data[,"Date"] == '2/2/2007'),]
    # concat two colums 'Date' and 'Time' in one column 'DateTime'
    two_days_data <- transform(two_days_data ,DateTime=interaction(Date,Time, sep=' '))
    two_days_data[["DateTimeParsed"]] <- strptime(two_days_data[, "DateTime"], "%d/%m/%Y %H:%M:%S")
    
    png("plot3.png", width = 480, height = 480)    
    with(two_days_data, plot(DateTimeParsed, Sub_metering_1, type="n", main="", 
                             xlab = "", ylab = "Energy sub metering"))
    with(two_days_data, lines(DateTimeParsed, Sub_metering_1, col = "black"))
    with(two_days_data, lines(DateTimeParsed, Sub_metering_2, col = "red"))
    with(two_days_data, lines(DateTimeParsed, Sub_metering_3, col = "blue"))
    legend("topright", pch = "-", col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 3)
    dev.off()
}