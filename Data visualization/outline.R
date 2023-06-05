
# ABOUT -------------------------------------------------------------------

# Outline for lesson
library(ggplot2)
library(dplyr)

?diamonds
diamonds

# Explore and summarize data
# -- Text
str(diamonds)
dim(diamonds)
summary(diamonds)

# Variable types and informational value
# All categorical (1x3)
xtabs(~ color, data = diamonds)
xtabs(~ color + cut, data = diamonds)
xtabs(~ color + cut + clarity, data = diamonds)

# Categorical + continuous (1x3)
tapply(diamonds$price, diamonds$color, mean)
tapply(diamonds$price, diamonds[, c("color", "clarity")], mean)
tapply(diamonds$price, diamonds[, c("color", "clarity", "cut")], mean)

# Continuous
summary(diamonds$carat)

# Continuous -> categorical
diamonds$carat.groups <- cut(diamonds$carat, breaks = 3, labels = c("Small", "Medium", "Large"))
table(diamonds$carat.groups)

xtabs(~ carat.groups + cut, data = diamonds)

# Continuous (1x1+)
# Text summaries are not helpful. Need to turn to graphic summaries.

# -- Graphics
p <- ggplot(data = diamonds)

# All categorical (1x3)
p + geom_bar(aes(x = color))
p + geom_bar(aes(x = color, fill = cut))
p + geom_bar(aes(x = color, fill = cut)) + facet_wrap(~ clarity)

# Categorical + continuous (1x3)
p + geom_boxplot(aes(x = color, y = price))
p + geom_boxplot(aes(x = color, y = price, fill = clarity))
p + geom_boxplot(aes(x = color, y = price, fill = clarity)) + facet_wrap(~ cut)

# Continuous (1x3)
summary(diamonds$carat)
p + geom_histogram(aes(x = carat))
p + geom_histogram(aes(x = carat), binwidth = .1)
p + geom_point(aes(x = carat, y = price))
p + geom_point(aes(x = carat, y = price)) + geom_smooth(aes(x = carat, y = price))

p <- ggplot(diamonds, aes(x = carat, y = price))

p + geom_point() + geom_smooth()
p + geom_point() + geom_smooth() + facet_wrap(~ cut)


# TESTS -------------------------------------------------------------------

library(tidyverse)
library(tidytext)
library(stringr)
sessionInfo()


# The Grammar of Graphics
# 1. Data (data)
# 2. Coordinate mappings (aesthetics)
# 3. Geometric forms (geoms)

load(file = "Data manipulation/data/narratives.RData")
belc <- tbl_df(belc)
belc$texts <- as.character(belc$texts)
belc$years <- substring(belc$age, 1, 2) |> as.numeric()
belc$sex <- as.factor(belc$sex)
belc$group <- substring(belc$group, 1, 1) |> as.factor()
belc$yymmdd <- belc$age |> str_replace_all("[;.]", "") |> as.numeric()
belc <- belc |> select(-age)
belc |> str()

belc.words <-
  belc |> # tidy words
  unnest_tokens(words, texts, token = "regex", pattern = " ")

belc.words <-
  belc.words |> # remove non-language in 'words'
  filter(str_detect(words, "\\/"))

belc.words <-
  belc.words |> # separate 'words' into 'word' and 'lang' columns
  separate(words, c("word", "lang"), sep = "\\/")
belc.words$chars <- belc.words$word |> nchar()
belc.words

belc <- belc.words[complete.cases(belc.words), ]
belc |>
  filter(str_detect(lang, "eng")) |>
  group_by(id, group) |>
  count()

# Dependent
# Categorical
ggplot(belc, aes(x = lang)) + geom_bar()

xtabs(~ lang + sex, data = belc)
ggplot(belc, aes(x = lang, fill = sex)) + geom_bar(position = "dodge")

xtabs(~ lang + group, data = belc)
ggplot(belc, aes(x = lang, fill = group)) + geom_bar(position = "fill")


# Continuous
ggplot(belc, aes(x = chars)) + geom_histogram(binwidth = .5)
ggplot(belc, aes(x = chars)) + geom_density()

# Dependent + Independent
#


# Diamonds ----------------------------------------------------------------

library(dplyr)
library(ggplot2)

data()

diamonds

# -- What kinds of variables? And, how many of them?

# Categorical measure
# Single variable, Frequency
table(diamonds$clarity)
xtabs(~ clarity, data = diamonds)
diamonds |> count(clarity)

ggplot(diamonds, aes(x = clarity)) + geom_bar() # histogram

# Additional variable
# Categorical, Frequency
xtabs(~ clarity + cut, data = diamonds) # contingency table
diamonds |> count(clarity, cut) # tidy dataset

ggplot(diamonds, aes(x = cut, fill = clarity)) + geom_bar() # stacked
ggplot(diamonds, aes(x = cut, fill = clarity)) + geom_bar(position = "dodge") # beside

ggplot(diamonds, aes(x = cut, fill = clarity)) + geom_bar(position = "fill") # proportions
ggplot(diamonds, aes(x = cut, y = price))

# Continuous
xtabs(~ clarity + price, data = diamonds) # too much information for a contingency table

diamonds |> group_by(clarity) |> summarise(mean(price), sd(price), median(price))
diamonds |> group_by(clarity) |> dplyr::
ggplot(diamonds, aes(x = price, y = cut))

# Continuous
xtabs(~ price, data = diamonds) # too much information!
ggplot(diamonds, aes(x = price)) + geom_bar() # histogram


ggplot(diamonds, aes(x = price)) + geom_density() # density plot

ggplot(diamonds, aes(x = price, fill = cut)) + geom_density(alpha = 1/2)


# survey ------------------------------------------------------------------

library(MASS)
?survey
str(survey)
summary(survey)

data <- survey[complete.cases(survey), ]
dim(data) 
dim(survey) 

str(data)