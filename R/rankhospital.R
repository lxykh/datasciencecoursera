rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    data <-
        read.csv("outcome-of-care-measures.csv",colClasses = "character")
    StateMatch = (data$State == state)
    if (sum(StateMatch) == 0) {
        stop("invalid state")
    }
    hospital = data[[2]][StateMatch]
    if (outcome == "heart failure") {
        mortality = as.numeric(data[[17]][StateMatch])
        hospital = hospital[!is.na(mortality)]
        mortality = mortality[!is.na(mortality)]
    }
    else if (outcome == "pneumonia") {
        mortality = as.numeric(data[[23]][StateMatch])
        hospital = hospital[!is.na(mortality)]
        mortality = mortality[!is.na(mortality)]
    }
    else if (outcome == "heart attack") {
        mortality = as.numeric(data[[11]][StateMatch])
        hospital = hospital[!is.na(mortality)]
        mortality = mortality[!is.na(mortality)]
    }
    else {
        stop("invalid outcome")
    }
    index = order(mortality,hospital)
    hospital = hospital[index]
    if (num == 'best') {
        result = hospital[1]
    }
    else if (num == 'worst') {
        result = tail(hospital,1)
    }
    else if (num > length(hospital)) {
        result = NA
    }
    else {
        result = hospital[num]
    }
    print(result)
}