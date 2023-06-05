
# ABOUT -------------------------------------------------------------------

# Outline for lesson

#
library(dplyr)
library(stringr)

load("Data manipulation/data/narratives.RData")

# Data frames

# Introspection ----
# Dimensions
dim(belc)

# Structure
str(belc)

# View
View(belc)

# dplyr function
belc <- tbl_df(belc)
belc # gives dim() and str() at the same time. Also does not print all records.

# Sort
arrange(belc, age)
arrange(belc, desc(group))

# Select (columns)
select(belc, texts)
select(belc, id:group)
select(belc, -texts)

# Filter (rows)
filter(belc, group == "1B")
belc <- filter(belc, str_detect(group, "A"))

# Create new columns
belc <- mutate(belc, years = substring(age, 1, 2))
belc$years

belc$years <- as.numeric(belc$years)

str_count(belc$texts, "/eng")
str_count(belc$texts, "/(eng|other)")

belc <- mutate(belc, eng.words = str_count(texts, "/eng"), all.words = str_count(texts, "/(eng|other)"))

belc <- select(belc, -texts, -age)
belc

# by ...
group_by(belc, group) %>%
  mutate(avg.years = mean(years))

# Summarize
# all
mean(belc$years)

# by...
group_by(belc, group) %>%
  summarise(avg.years = mean(years))


