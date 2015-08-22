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
        #old.directory <- getwd()
        #setwd(directory)
        n <- 0
        sum <- 0
        y.pollutant <-as.numeric()
        for (i in id){
                filename <- sprintf("%s/%03d.csv", directory, i)
                x<- read.csv(filename)
                good <- complete.cases(eval(parse(text=sprintf("x$%s",pollutant))))
                y <- x[good,]
                #y.pollutant <- eval(parse(text=sprintf("y$%s",pollutant)))
                y.pollutant <- y[,pollutant]
                sum = sum + sum(y.pollutant)
                n <- n + length(y.pollutant)
        }
        #setwd(old.directory)
        as.numeric(sprintf("%1.3f",sum/n))
        
#        #Compact code 1     
#         files_list <- dir(directory, full.names=TRUE)        
#         dat <- data.frame()                                  
#         for (i in id) {                                      
#                 dat <- rbind(dat, read.csv(files_list[i]))
#         }
#         mean(dat[, pollutant], na.rm=T)
                
#         #Compact code 2
#         files_list <- dir(directory, full.names=TRUE)
#         dat <- as.numeric()
#         for (i in id) {
#                 dat <- c(dat, read.csv(files_list[i])[, pollutant])
#         }
#         mean(dat, na.rm=T)                      
   
}