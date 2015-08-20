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
        #old.directory <- getwd()
        #setwd(directory)
        nobs <- vector(mode="numeric", length=length(id))
        idx <- 1
        #nobs <- numeric(0)
        for (i in id){
                filename <- sprintf("%s/%03d.csv",directory, i)
                x<- read.csv(filename)
                good <- complete.cases(x)
                nobs[idx] <- sum(good)
                idx <- idx + 1
                #nobs <- c(nobs, nrow(na.omit(x)))
        }
       
        data.frame("id" = id, "nobs" = nobs)

}