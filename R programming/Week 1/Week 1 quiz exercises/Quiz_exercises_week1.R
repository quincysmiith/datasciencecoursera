########
#
# Coursera R programming
# Week 1 quiz exercises
#
########

# Set working directory
setwd("~/Documents/datasciencecoursera/R programming/Week 1/Week 1 quiz exercises")

#load data
data <- read.csv("hw1_data.csv")

# Columns in data
print("What columns are in the data")
names(data)

# Question 12
# First 2 rows
print("First 2 rows")
head(data, n = 2)

# Question 13
# Number of rows in data
print("Number of rows")
nrow(data)

# Question 14
# Last 2 rows
print("Last 2 rows")
tail(data, n=2)

# Question 15
# Ozone in 47th row
print("Ozone in 47th row")
data[["Ozone"]][[47]]

# Question 16
# number of NAs in Ozone
print("Number of NAs in Ozone")
nrow(data) - nrow(na.omit(data["Ozone"]))