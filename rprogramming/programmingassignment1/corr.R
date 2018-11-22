## funtion takes a directory of data files and a threshold for complete cases
## and calculates the correlation between sulfate and nitrate for monitor locations
## where the number of completely observed cases (on all variables) is greater than
## the threshold
corr <- function(directory, threshold = 0) {
    ## threshold is a numeric vector of length 1 indicating the number of
    ## completely observed observations on all variables required to computer
    ## the correlatino between nitrate and sulfate; default = 0
    filedirectory <- paste(getwd(), "/", directory, sep = "") #getting file directory path
    files <- list.files(path = filedirectory, pattern = ".csv", full.names = TRUE) #loading all files in path
    vec_corr <- numeric()
    
    for (f in 1:length(files)) {
        data <- read.csv(files[f]) #read through each file
        compcases <- sum((!is.na(data$sulfate)) & (!is.na(data$nitrate))) #get sum of complete cases
        if (compcases > threshold) {
            vec_corr <- c(vec_corr, cor(data$sulfate, data$nitrate, use = "complete.obs" )) #create vector of corr complete cases 
        }
        else {
            0
        }
        
    }
    vec_corr
}