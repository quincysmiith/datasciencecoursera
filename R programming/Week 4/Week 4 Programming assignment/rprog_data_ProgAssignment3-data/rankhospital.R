###############
#
# Programming assignment 3
# Part 2
# Marquin Smith
#
##############

rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = 'character')
    
    ## Check that state and outcome are valid
    valid_state <- FALSE
    for (i in unique(data$State)){
        if(i == state){
            valid_state <- TRUE
        }
    }
    outcome_list <- as.list(c("heart attack", "heart failure", "pneumonia"))
    valid_outcome <- FALSE
    for (i in outcome_list){
        if(i == outcome){
            valid_outcome <- TRUE
        }
    }
    
    
    if (valid_state == FALSE){
        stop("invalid state")
    }
    if(valid_outcome == FALSE){
        stop("invalid outcome")
    }
    
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    if(outcome == "heart attack"){
        my_column <- 11
    }
    if(outcome == "heart failure"){
        my_column <- 17
    }
    if(outcome == "pneumonia"){
        my_column <- 23
    }
    data[,my_column] <- as.numeric(data[,my_column])
    subset1 <- data[data$State == state, c(2, my_column)]
    
    subset1 <- subset1[complete.cases(subset1),]
    
    #subset1 <- subset1[order(subset1[,2]),]
    subset1 <- subset1[order(subset1[,2], subset1[,1]),]
    
    if(num == 'best'){
        my_rank <- 1
    } else if (num == 'worst'){
        my_rank <- nrow(subset1)
    } else {
        my_rank <- num
    }
    
    subset1$Hospital.Name[my_rank]
    
}