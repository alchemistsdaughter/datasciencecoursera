## returns a list of hospitals with the lowest 30 day
## mortality rate for heart attack, heart failure, or pneumonia

best <- function (state, outcome) {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available")
  data <- na.omit(data)
  ## check that state and outcome are valid
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  if (!state %in% data[, 7]) {
    stop("invalid state input")
  } else if (outcome %in% valid_outcomes == FALSE) {
    stop("invalid outcome input")
  }
  
  ## subset data based on selected state 
  statesub <- subset(data, data$State== state)
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  outcome_col <- if(outcome == "heart attack") {
      11
  } else if (outcome == "heart failure") {
      17
  } else if (outcome == "pneumonia") {
      23
  } ## returns the col # based on outcome input
  
  y <- as.numeric(statesub[,outcome_col])
  z <- min(y, na.rm = TRUE)
  finalsub <- subset(statesub, statesub[, outcome_col] %in% z) #subset of hospitals with loweset rate
  ## order final subset
  finalsub <- order(finalsub)
  hospname <- finalsub[2]
  hospname
}