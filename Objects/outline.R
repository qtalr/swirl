
# ABOUT -------------------------------------------------------------------
# Lesson: Objects
# Outline for lesson

# rm(list = ls())

# Vectors,

x <- c(1,2,3,4)
y <- 1:4
z <- seq(4)

# all.equal(x, y, z)

# Tables,
var.table <- table(x)
var.table
class(var.table)

# "Value types (e.g. character, numeric, integer, logical)",
class(x)
class(y)

var.char.words <- c("This", "is", "a", "sentence.")
var.char.sents <- c("This is a sentence.")

               "This is another sentence.",
               "This is yet another sentence.",
               "Tan you believe it another sentence?")
var.logical <- c(TRUE, FALSE, FALSE, TRUE)

var.char.words
class(var.char.words)
var.char.sents
class(var.char.sents)
var.logic
class(var.logical)


# Data frames `data.frame()`,
var.df <- data.frame(id = x,
                     word = var.char.words,
                     sent = var.char.sents,
                     boundary = var.logical)

var.df
class(var.df)

# Matrices (numeric only data frames),
# View object types `class()`,
# View complex objects `str()` & `summary()`

# Lists,
