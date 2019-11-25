#Mette Nissen 25.11.2019 Exercise 5, data wrangling with human creation.


#reading data

hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

#Installing packages

install.packages("plyr")
library(dplyr)
library(ggplot2)
library(GGally)
library(tidyverse)
library(plyr)

#Taking a glimpse of the data

summary(hd)
summary(gii)
glimpse(hd)
glimpse(gii)

#Renaming variables and glimpsing the data again

hd <- rename(hd, c("HDI.Rank"="rank", "Country"="country", "Human.Development.Index..HDI."="hdi", "Life.Expectancy.at.Birth"="lifeexp", "Expected.Years.of.Education"="expedu", "Mean.Years.of.Education"="meanedu", "Gross.National.Income..GNI..per.Capita"="gni", "GNI.per.Capita.Rank.Minus.HDI.Rank"="gni_hdi"))

summary(hd)
str(hd)

gii <- rename(gii, c("GII.Rank"="gii_rank", "Country"="country", "Gender.Inequality.Index..GII."="gen_ii", "Maternal.Mortality.Ratio"="mmr", "Adolescent.Birth.Rate"="abr", "Percent.Representation.in.Parliament"="rep_parl", "Population.with.Secondary.Education..Female."="sec_edu_fem", "Population.with.Secondary.Education..Male."="sec_edu_male", "Labour.Force.Participation.Rate..Female."="lab_fem", "Labour.Force.Participation.Rate..Male."="lab_male"))

summary(gii)

#Creating new variables
gii <- mutate(gii, ratioedu=sec_edu_fem/sec_edu_male)
gii <- mutate(gii, ratiolab=lab_fem/lab_male)

head(gii)

# joining the datasets with country
human <- inner_join(hd, gii, by = "country")

# cchecking dimensions
str(human)

# creating a file out 
write.csv(human, file = "data/human.csv", row.names = FALSE)




str(gii)