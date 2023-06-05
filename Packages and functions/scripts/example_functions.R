
# ABOUT -------------------------------------------------------------------

# Example functions for Swirl coding exercise lesson 'Packages and functions'

myMean <- function(x) {
  # Calculate the mean for a numeric vector
  sum(x) / length(x)
}

helloUser <- function(user.name) {
  # Print a hello message to the user
  paste("Hello,", user.name)
}

helloUserTitle <- function(user.name, title) {
  # Print a hello message to the user with their title included
  paste("Hello,", title, user.name)
}

plotRandomNums <- function(size, max.num = 100, title = "Random numbers", ...) {
  library(magrittr)
  random.numbers <- runif(n = size, min = 1, max = max.num) %>% sort(...)
  plot(random.numbers, main = title)
}

