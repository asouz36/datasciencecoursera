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
        old.directory <- getwd()
        setwd(directory)
        n <- 0
        sum <- 0
        for (i in id){
                filename <- sprintf("%03d.csv", i)
                x<- read.csv(filename)
                good <- complete.cases(x)
                y <- x[good,]
                #y.pollutant <- eval(parse(text=sprintf("y$%s",pollutant)))
                y.pollutant <- y[,pollutant]
                sum = sum + sum(y.pollutant)
                n <- n + length(y.pollutant)
        }
        setwd(old.directory)
        as.numeric(sprintf("%1.3f",sum/n))
}