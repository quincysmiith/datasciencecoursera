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

# Question 17
# Mean of Ozone NAs removed
print("Mean of Ozone NAs removed")
mean(data$Ozone, na.rm = TRUE)

# Question 18
# mean of solar when Ozone above 31 and Temp above 90
new_data <- data[data$Ozone > 31, 1:6]
new_data2 <- new_data[new_data$Temp > 90, 1:6]
mean(new_data2$Solar.R, na.rm = TRUE)

# Question 19
# Mean of temp when month equal to 6
june_data <- data[data$Month == '6', 1:6]
mean(june_data$Temp)

# Question 20
# Max Ozone in May
print("Max Ozone in May")
may_data <- data[data$Month == 5 , 1:6]
max(may_data$Ozone, na.rm = TRUE)


