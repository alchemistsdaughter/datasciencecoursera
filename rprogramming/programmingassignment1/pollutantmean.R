pollutantmean <- function(directory, pollutant, id = 1:332) {
    ##'directory' is a ch vector of length 1 indicating the location of the CSV files
    ##'pollutant' is a ch vector of length 1 indicating the name of the 
    ## pollutant for which we will caluclate the mean; it can either be
    ## "sulfate" or "nitrate"
    ## 'id' is an integer vector indicating the monitor ID numbers to be used
    ## Return the mean of the pollutant across al monitors list
    ## must ignore NA values
    filedirectory <- paste(getwd(), "/", directory, sep = "")
    files <- list.files(path = filedirectory, pattern = ".csv", full.names = TRUE)
    polcount <- numeric()
    
    for (num in id) {
        data <- read.csv(files[num])
        polcount <- c(polcount, data[[pollutant]])
    }
    mean(polcount, na.rm = TRUE)
}    
