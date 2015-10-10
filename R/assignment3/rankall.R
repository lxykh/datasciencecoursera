rankall <- function(outcome, num = "best") {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    data <-
        read.csv("outcome-of-care-measures.csv",colClasses = "character")
    state = unique(data[[7]])
    hospital = character()
    for (i in 1:length(state)) {
        StateMatch = (data$State == state[i])
        hospitals = data[[2]][StateMatch]
        if (outcome == "heart failure") {
            mortality = as.numeric(data[[17]][StateMatch])
            hospitals = hospitals[!is.na(mortality)]
            mortality = mortality[!is.na(mortality)]
        }
        else if (outcome == "pneumonia") {
            mortality = as.numeric(data[[23]][StateMatch])
            hospitals = hospitals[!is.na(mortality)]
            mortality = mortality[!is.na(mortality)]
        }
        else if (outcome == "heart attack") {
            mortality = as.numeric(data[[11]][StateMatch])
            hospitals = hospitals[!is.na(mortality)]
            mortality = mortality[!is.na(mortality)]
        }
        else {
            stop("invalid outcome")
        }
        index = order(mortality,hospitals)
        hospitals = hospitals[index]
        if (num == 'best') {
            result = hospitals[1]
        }
        else if (num == 'worst') {
            result = tail(hospitals,1)
        }
        else if (num > length(hospitals)) {
            result = NA
        }
        else {
            result = hospitals[num]
        }
        hospital = c(hospital,result)
    }
    data.frame(state,hospital)
}