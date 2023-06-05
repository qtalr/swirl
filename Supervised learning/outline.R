
# ABOUT -------------------------------------------------------------------

# Outline for lesson
library(dplyr)
library(caret)
library(e1071)

# Iris ------------------------------------------------------------------------------

glimpse(iris)

train.index <- createDataPartition(y = iris$Species, times = 1, p = .75, list = FALSE)
length(train.index) # length of training set

iris.train <- iris[train.index, ] # training set
iris.test <- iris[-train.index, ] # testing set

table(iris.train$Species) %>% prop.table()
table(iris.test$Species) %>% prop.table()

head(iris.train)

nb.iris <- naiveBayes(Species ~ ., data = iris.train)
nb.iris

results.iris <- predict(nb.iris, iris.test[, -5])
results.iris %>% table %>% prop.table

confusionMatrix(data = results.iris, 
                reference = iris.test$Species, 
                dnn = c("Predicted", "Actual"))

# Verbs -----------------------------------------------------------------------------

library(languageR)
data(verbs)
glimpse(verbs)

train.index <- createDataPartition(y = verbs$RealizationOfRec, p = .75, list = FALSE)

verbs.train <- verbs[train.index, ] # training set
verbs.test <- verbs[-train.index, ] # training set

verbs.train$RealizationOfRec %>% table %>% prop.table
verbs.test$RealizationOfRec %>% table %>% prop.table

# Naive Bayes

nb.verbs <- naiveBayes(RealizationOfRec ~ ., data = verbs.train)
nb.verbs

predict(nb.verbs, verbs.test[1, -1])
verbs.test[1,1]

results.verbs <- predict(nb.verbs, verbs.test[, -1])
results.verbs %>% table %>% prop.table

confusionMatrix(data = results.verbs, 
                reference = verbs.test$RealizationOfRec, 
                dnn = c("Predicted", "Actual"))

# Logistic Regression

lr.verbs <- glm(RealizationOfRec ~ ., data = verbs.train, family = binomial)

predict(lr.verbs, verbs.test[, -1], type = 'response')
