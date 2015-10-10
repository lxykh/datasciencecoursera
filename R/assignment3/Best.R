best <- function(state,outcome) {
    data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
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
    index = which(mortality == min(mortality))
    besthospital = sort(hospital[index])[1]
}