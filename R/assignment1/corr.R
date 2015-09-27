corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
    stats = numeric(0)
    for (i in 1:332) {
        tmp <- toString(i)
        if (nchar(tmp) == 1) {
            tmp <- paste0("00",tmp)
        }
        else if (nchar(tmp) == 2) {
            tmp <- paste0("0",tmp)
        }
        data <- read.csv(paste0(directory,"/",tmp,".csv"))
        nobs = sum((!is.na(data$sulfate) & !is.na(data$nitrate)))
        if (nobs > threshold){
            stats = c(stats,cor(data$nitrate,data$sulfate,use = "complete.obs"))
        }
    }
    stats
}