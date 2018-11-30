## returns a hospital with given rank (num arg) in given state
## mortality rate for heart attack, heart failure, or pneumonia

rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available")
  
  ## check that state and outcome are valid
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  if (!state %in% data[, 7]) {
    stop("invalid state")
  } else if (outcome %in% valid_outcomes == FALSE) {
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
  
  #convert death rate to numeric
  y <- as.numeric(data[,outcome_col])
  data <- data[order(y, data[,2]),]
  
  ## subset data based on selected state and outcome - returns data frame with hospital name and death rate
  statesub <- subset(data, data$State== state, select = c(2, outcome_col))
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  finalsub <- na.omit(statesub)
  if (num == "worst") {
    finalsub[nrow(finalsub),1]
  }
  else if (num == "best") {
    finalsub[1,1]
  }
  else {
    finalsub[num,1]
  }
}


