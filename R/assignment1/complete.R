complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    x = numeric(0)
    nobs = numeric(0)
    for (i in 1:length(id)) {
        t <- toString(id[i])
        if (nchar(t) == 1) {
            tmp <- paste0("00",t)
        }
        else if (nchar(t) == 2) {
            tmp <- paste0("0",t)
        }
        else {tmp = t}
        data <- read.csv(paste0(directory,"/",tmp,".csv"))
        x = c(x,t)
        nobs = c(nobs,sum((!is.na(data$sulfate) & !is.na(data$nitrate))))
    }
    id = x
    data.frame(id,nobs)
}