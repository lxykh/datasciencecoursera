pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!
    all <- numeric(0)
    for (i in 1:length(id)) {
        tmp <- toString(id[i])
        if (nchar(tmp) == 1) {
            tmp <- paste0("00",tmp)
        }
        else if (nchar(tmp) == 2) {
            tmp <- paste0("0",tmp)
        }
        data <- read.csv(paste0(directory,"/",tmp,".csv"))
        all <- c(all,data[[pollutant]])
    }
    output <- mean(all,na.rm=TRUE)
}