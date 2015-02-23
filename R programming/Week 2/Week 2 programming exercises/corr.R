#####################
# Marquin Smith
# 15th February 2015
#
# Coursera - R programming
# Data Science specialization
#
#####################


#########
# Part 3
#########

#setwd("~/Documents/datasciencecoursera/R programming/Week 2/Week 2 programming exercises")


corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    
    
    # Load in all data
    file_list <- list.files(directory)
    
    
    # Load in all the files
    First_time <- TRUE
    for (i in file_list) {
        if (First_time) {
            file_string <- paste(directory, "/", i, sep = "")
            all_data <- read.csv(file_string)
            First_time <- FALSE
        } else {
            file_string <- paste(directory, "/", i, sep = "")
            temp_data <- read.csv(file_string)
            all_data = rbind(all_data, temp_data)
        }
    }
    
    # Get number of complete cases
    complete_cases_list = list()
    
    
    for(i in 1:length(file_list)){
        file_string <- paste(directory, "/", file_list[i], sep = "")
        data <- read.csv(file_string)
        comp_cases = nrow(data[complete.cases(data),])
        complete_cases_list[[i]] <- comp_cases
    }
    
    complete_cases <- as.vector(complete_cases_list)
    new_data <- data.frame(id = 1:332)
    new_data$nobs <-  complete_cases    
    
    # which ids are we keeping
    keepers <- new_data[new_data$nobs > threshold, ]
    keepers <- as.vector(keepers$id)
    
    # Correlate each id we are keeping
    
    n_keepers = length(keepers)
    corr_vec = vector()
    
    for (i in 1:n_keepers){
        new_data <- all_data[all_data$ID == keepers[i], ]
        if (nrow(new_data) > 0){
            my_cor <- cor(x = new_data$nitrate, y = new_data$sulfate,
                          use = "pairwise.complete.obs")
            corr_vec[i] <- my_cor
        } #else {
            #corr_vec[[1]] <- 0
        #}
        
    }
    #corr_list <- as.vector(corr_list)
    
    corr_vec
}