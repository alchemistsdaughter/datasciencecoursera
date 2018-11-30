## Returns a 2-column data frame containing the hospital in each state that has the 
## ranking specific in num

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available")
  
  ## check that outcome is valid
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  if (outcome %in% valid_outcomes == FALSE) {
    stop("invalid outcome")
  }
  
  
  ## returns the col # based on outcome input
  outcome_col <- if(outcome == "heart attack") {
    11
  } else if (outcome == "heart failure") {
    17
  } else if (outcome == "pneumonia") {
    23
  } 
  
  y <- as.numeric(data[,outcome_col])
  ## create a dataframe with state, hospital, and outcome rate
  newdata <- data.frame(data$State, data$Hospital.Name, y)
  newdata <- newdata[order(newdata[,1], newdata[,3], newdata[,2]),] #order by outcome
  newdata <- na.omit(newdata) #get rid of NAs
  splitdata <- split(newdata, newdata[,1]) #split data by state
  
  ## for each state return the hospital with given rank (num)
  result <- c()
  for (s in 1:length(splitdata)) {
    result[s] <- c(newdata[num,2])
  }
  
  result
  # OLD CODE: statesub <- subset(data, data$State== state, select = c(2, outcome_col))
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate

}


