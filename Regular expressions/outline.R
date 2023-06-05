
# ABOUT -------------------------------------------------------------------

# Outline for lesson

data(package = "quanteda")
tokens <- inaugTexts[1] %>% tokenize() %>% unlist %>% as.vector
length(tokens)
cat(tokens, file = "./Regular expressions/tokens.txt", sep = "\n")

# Literals
# strings

str_extract(tokens, "the") %>% table
str_extract(tokens, "ing") %>% table

# Metacharacters
# Special characters for extending pattern matching

# . any single character
str_extract(tokens, "the.") %>% table
# + 1 or more of the previous item
str_extract(tokens, "the.+") %>% table
# * 0 or more of the previous item
str_extract(tokens, "the.*") %>% table
str_extract(tokens, ".*the.*") %>% table

# {} exact number of previous item
str_extract(tokens, ".*e{2}.*") %>% table
# {,} range of number of previous item
str_extract(tokens, ".*e{1,2}.*") %>% table

# ? optional previous item
str_extract(tokens, ".+ings?") %>% table


# [] one of many single items
str_extract(tokens, "[ABC].+") %>% table

# [-] range
str_extract(tokens, "[A-Z].*") %>% table
str_extract(tokens, "[0-9].*") %>% table

# (|) one of the alternatives
str_extract(tokens, ".+(ing|ed)") %>% table

# Anchors
str_extract(tokens, "^[aeo].*the.+") %>% table

# $ end anchor
str_extract(tokens, "the.+e$") %>% table

# Character classes -------------------------------------------------------
# [:alpha:]
str_extract(tokens, "[:alpha:]") %>% table

# [:digit:]
str_extract(tokens, "[:digit:]") %>% table
str_extract(tokens, "\\d") %>% table
str_extract(tokens, "\\D") %>% table

# [:alnum:]
str_extract(tokens, "[:alnum:]") %>% table
str_extract(tokens, "\\w") %>% table
str_extract(tokens, "\\W") %>% table

# [:punct:]
str_extract(tokens, "[:punct:]") %>% table

# Escaping ----------------------------------------------------------------

str_extract(tokens, "\\.") %>% table
str_extract(tokens, "\\(") %>% table

