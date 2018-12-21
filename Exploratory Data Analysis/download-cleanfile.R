if(!file.exists('.Electric power consumption.zip')) {
    download.file(filename, './Electric power consumption.zip', mode = 'wb')
    unzip("Electric power consumption.zip", exdir = getwd())
}

#read data table, specify classes
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClass = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))

#change the class for date and time Columns
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#subset data to only 2007-02-01 -- 2007-02-02
data_sub <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-2-2"))