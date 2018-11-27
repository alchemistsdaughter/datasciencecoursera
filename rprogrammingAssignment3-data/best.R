## returns a list of hospitals with the lowest 30 day
## mortality rate for heart attack, heart failure, or pneumonia

best <- function (state, outcome) {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## check that state and outcome are valid
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  if (!state %in% data[, 7]) {
    stop("invalid state input")
  } else if (outcome %in% valid_outcomes == FALSE) {
    stop("invalid outcome input")
  }
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  
  
}