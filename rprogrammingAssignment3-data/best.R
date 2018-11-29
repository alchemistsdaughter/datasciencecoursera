## returns a list of hospitals with the lowest 30 day
## mortality rate for heart attack, heart failure, or pneumonia

best <- function (state, outcome) {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available")
  
  ## check that state and outcome are valid
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  if (!state %in% data[, 7]) {
    stop("invalid state")
  } else if (outcome %in% valid_outcomes == FALSE) {
    stop("invalid outcome")
  }
  
 
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  
  ## returns the col # based on outcome input
  outcome_col <- if(outcome == "heart attack") {
      11
  } else if (outcome == "heart failure") {
      17
  } else if (outcome == "pneumonia") {
      23
  } 
  
  y <- as.numeric(data[,outcome_col])
  data <- data[order(y),]
  ## subset data based on selected state and outcome - returns data frame with hospital name and death rate
  statesub <- subset(data, data$State== state, select = c(2, outcome_col))
  
  #sort by outcome_col lowest to highest
  #return lowest
  statesub[1,1]
}
