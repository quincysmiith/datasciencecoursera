####################
#
# Programming Assignment 3
# Week 4
# The last assignment yay!... almost there
#
####################

setwd("~/Documents/datasciencecoursera/R programming/Week 4/Week 4 Programming assignment/rprog_data_ProgAssignment3-data")

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = 'character')
head(outcome)
names(outcome)

# make column 11 numeric type
# this column is 'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack'
outcome[,11] <- as.numeric(outcome[,11])

# plot column 11 as a histogram
hist(outcome[,11])