#Mette Nissen 2.12.2019 Exercise 5, data wrangling with human data.

human <- read.csv("human.csv")

install.packages("FactoMineR")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)
library(GGally)
library(tidyverse)
library(plyr)
library(FactoMineR)
str(human)
summary(human)

# transform GNI into a numeric variable
human <- mutate(human, GNI = str_replace(human$GNI, pattern=",", replace ="") %>% as.numeric)
human$GNI

# creating a subset
keep_columns <- c("country", "Edu2.FM", "Labo.FM", "Edu.Exp", "Life.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")
human <- dplyr::select(human, one_of(keep_columns))
str(human)

# checking for missing values
data.frame(human[-1], comp = complete.cases(human))

# filtering missing values 
human <- filter(human, complete.cases(human))

# removing regions from the 'country' variable
human$country
last <- nrow(human) - 7
human <- human[1:last, ]

# adding countries as rownames
rownames(human) <- human$country


# removing the 'country' variable
human <- select(human, -country)
str(human)
head(human)

write.csv(human, file = "human.csv")
read.csv("human.csv")
