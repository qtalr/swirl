
# ABOUT -------------------------------------------------------------------

# Outline for lesson

# Iterative processing with vectors
# Vectorization

# Arithmatic
x <- 1:10
x * 2
c(1*2, 2*2, 3*2, 4*2, 5*2, 6*2, 7*2, 8*2, 9*2, 10*2)

# Characters
y <- c("This is a sentence.", "This is another sentence.", "OK, here's another, just for fun.")
class(y)
str(y)

nchar(y)
nchar(c(y[1], y[2], y[3]))

length(y)
tolower(y)

# Lists
# We wish to apply a given function to every element of a list and obtain a list as result . - Read more at: http://scl.io/fCPufvMf#gs.4PxwJY4
# The split-apply-combine paradigm

my.list <- list(a = 1:10, b = 2:20)
lapply(my.list, mean)
sapply(my.list, mean)

library(quanteda)
z <- tokenize(y)
z
class(z)
str(z)

nchar(z)
length(z)

lapply(z, length)
sapply(z, length)

# Data frames
head(iris)
lapply(iris[, 1:4], mean)
tapply(iris$Sepal.Length, iris$Species, mean)

lapply(z, function(x) { paste("Word: ", x) })
