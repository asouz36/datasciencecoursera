corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!
        
        files_list <- dir(directory, full.names=TRUE)
        dat <- as.numeric()
        n <- length(files_list)
        for (i in 1:n){
                x<- read.csv(files_list[i])
                good <- complete.cases(x)
                nobs <- sum(good)
                if (nobs > threshold){
                        y <- x[good,]
                        dat <- c(dat, cor(y$sulfate,y$nitrate))
                }
                
        }
        dat
}