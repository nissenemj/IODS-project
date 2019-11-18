install.packages("dplyr")

library(dplyr)

alc <- read.csv("alc.csv", header = TRUE, sep = ",")


library(ggplot2)
library(GGally)
library(tidyverse)
library(dplyr)
library(knitr)

kable(summary(alc), digits = 2)


#Creating graphics
p1 <- ggplot(alc, aes(x = absences, y = alc_use, col = sex)) + geom_point() 
p1
p <- ggpairs(alc, columns = c("sex", "age", "absences","goout", "G1", "G2", "G3", "guardian", "high_use"), mapping = aes(col = sex, alpha = 0.3), lower = list(combo = wrap("facethist", bins = 20)))
p
?ggpairs
# initialize a barchart of alcohol use difference between genders
g1 <- ggplot(data = alc, aes(x=sex)) + geom_bar() + facet_wrap("high_use")
g1

# initialize a plot of alcohol use and going out with friends
g2 <- ggplot() + geom_boxplot(data = alc, aes(x = sex, y = goout)) + facet_wrap("high_use")
g2

# Boxplot of alcohol use and school final grade
g3 <- ggplot() + geom_boxplot(data = alc, aes(x = sex, y = G3)) + facet_wrap("high_use")
g3

# Scatterplot showing linear model between age and abscences separated by alcohol consumption
g4 <- ggplot(data = alc, aes(x = age, y = absences, color=sex, alpha = 0.3)) + geom_point() + facet_wrap("high_use")+ geom_jitter() + geom_smooth(method = "lm")
g4

