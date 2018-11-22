## a function that reads a directory full of file and reports the number
## of completely observed cases in each data file
## The function should return a data frame where the first column is the name
## of the file and the 2nd column is the # wof complete cases

complete <- function(directory, id = 1:332) {
    filedirectory <- paste(getwd(), "/", directory, sep = "") #getting file directory path
    files <- list.files(path = filedirectory, pattern = ".csv", full.names = TRUE) #loading all files in path
    completecases <- data.frame() #creating an empty dataframe to be used later
    
    for (num in id) {
        data <- read.csv(files[num]) #read through each file
        nobs <- sum(complete.cases(data)) #sum the complete cases in each file
        dframe <- data.frame(num, nobs) #create dataframe with completecases
        completecases <- rbind(completecases, dframe)
    }
    
    colnames(completecases) <- c("id", "nobs")
    completecases
}