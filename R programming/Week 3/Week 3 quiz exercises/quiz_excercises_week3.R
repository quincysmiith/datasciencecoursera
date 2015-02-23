############
#
# Week 3 quiz
#
# Marquin Smith
############

# Question 1
# mean of sepal length for virginica

library(datasets)
data(iris)

?iris

head(iris)
str(iris)

s <- split(iris, iris$Species)
lapply(s, function(x) colMeans(x[, c("Sepal.Length", "Sepal.Width")]))


# Question 2
# what R code returns a vector of the means of the variables 'Sepal.Length',
# 'Sepal.Width', 'Petal.Length', and 'Petal.Width'

apply(iris[, 1:4], 2, mean)


# Question 3
# How can one calculate the average miles per gallon (mpg) by number of 
# cylinders in the car (cyl)?


library(datasets)
data(mtcars)

head(mtcars)

with(mtcars, tapply(mpg, cyl, mean))
s[1] - s[3]



s <- with(mtcars, tapply(hp, cyl, mean))
s[1] - s[3]
