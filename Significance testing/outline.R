
# ABOUT -------------------------------------------------------------------

# Outline for lesson
library(dplyr)
library(ggplot2)
library(party)

# Scenario #1 -------------------------------------------------------------
# Categorical dependent variable

head(a)

tab <- xtabs(~ construction, data = a)
tab

results <- chisq.test(tab)
results

# Scenario #2 -------------------------------------------------------------
# Categorical dependent variable + 1 categorical independent variable

tab <- xtabs(~ concreteness + construction, data = a)
tab

results <- chisq.test(tab)
results

assocplot(tab)

# Scenario #3 -------------------------------------------------------------
# Categorical dependent variable + 2+ categorical independent variables

xtabs(~ concreteness + construction + variety, data = a)

library(party)
a[,1:3] <- lapply(a[,1:3], as.factor)
str(a)

results <- ctree(construction ~ concreteness + variety, data = a)

plot(results)

# Scenario #4 -------------------------------------------------------------
# Continuous dependent variable

head(b)

shapiro.test(b$len_io)

# Scenario #5 -------------------------------------------------------------
# Continuous dependent variable + 1 categorical independent variable

tapply(b$len_io, b$construction, mean)

wilcox.test(len_io ~ construction, data = b)
wilcox.test(len_io ~ construction, data = b, alternative = "greater")

# Scenario #6 -------------------------------------------------------------
# Continuous dependent variable + 1 continuous independent variable

head(c)

shapiro.test(c$len_syll)
shapiro.test(c$num_wrds)

cor.test(c$len_syll, c$num_wrds, method = "kendall")

# Scenario #7 -------------------------------------------------------------
# Continuous dependent variable + 2+ independent variables

results <- lm(len_syll ~ num_wrds + variety, data = c)
summary(results)
