#####################
# Marquin Smith
# 13th February 2015
#
# Coursera - R programming
# Data Science specialization
#
#####################


#########
# Part 2
#########

#setwd("~/Documents/datasciencecoursera/R programming/Week 2/Week 2 programming exercises")




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
    
    file_list <- list.files(directory)
    
    
    
    id_list = list()
    complete_cases_list = list()
    count = 1
    
    for(i in id){
        file_string <- paste(directory, "/", file_list[i], sep = "")
        data <- read.csv(file_string)
        comp_cases = nrow(data[complete.cases(data),])
        complete_cases_list[[count]] <- comp_cases
        count <- count + 1
    }
    
    complete_cases <- as.vector(complete_cases_list)
    new_data <- data.frame(id = id)
    new_data$nobs <-  complete_cases    
    new_data
}