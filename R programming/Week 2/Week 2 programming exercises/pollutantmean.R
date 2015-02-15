#####################
# Marquin Smith
# 13th February 2015
#
# Coursera - R programming
# Data Science specialization
#
#####################


#########
# Part 1
#########

#setwd("~/Documents/datasciencecoursera/R programming/Week 2/Week 2 programming exercises")

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
    
    file_list <- list.files(directory)
    
    
    # Load in all the files
    First_time <- TRUE
    for (i in file_list) {
        if (First_time) {
            file_string <- paste(directory, "/", i, sep = "")
            data <- read.csv(file_string)
            First_time <- FALSE
        } else {
            file_string <- paste(directory, "/", i, sep = "")
            temp_data <- read.csv(file_string)
            data = rbind(data, temp_data)
        }
    }
    
    #Subset the monitor IDs
    First_time <- TRUE
    for (i in id) {
        if (First_time){
            new_data <- data[data$ID == i,]
            First_time <- FALSE
        } else {
            temp_data <- data[data$ID == i,]
            new_data <- rbind(new_data, temp_data)
        }
    }
    
    # get mean of Column I want
    my_mean <- NULL
    if (pollutant == "sulfate"){
        my_mean <- mean(new_data$sulfate, na.rm = TRUE)
    } else if (pollutant == "nitrate"){
        my_mean <- mean(new_data$nitrate, na.rm = TRUE)
    }
    
    my_mean
}