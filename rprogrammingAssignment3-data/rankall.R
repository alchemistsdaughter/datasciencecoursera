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
  
  ## sort data by state and outcome col and get rid of NA
  data <- na.omit(data[order(data$State, y),])
  
  ## for each state return the hospital with given rank (num)

  answer <- split(data, data$State)
  final <- lapply(answer, function(returnhospital) {returnhospital[num,2]})

  ## Return hospital name in that state with the given rank
  ## 30-day death rate

}