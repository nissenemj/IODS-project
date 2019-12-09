#Data Wrangling exercise 6


library(dplyr)
library(tidyr)


#Load the data sets (BPRS and RATS)

BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", header = TRUE, sep = " ")
RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", header = TRUE, sep = '\t')

#Inspecting the WIDE data
names(BPRS)
names(RATS)

summary(BPRS)
summary(RATS)

str(BPRS)
str(RATS)

#Treatment weeks seems to be in different colums

#Convert categorical data to factors - BPRS

BPRS$treatment <- factor(BPRS$treatment)
BPRS$subject <- factor(BPRS$subject)

#BPRS to long form
BPRSL <-  BPRS %>% gather(key = weeks, value = bprs, -treatment, -subject)

# Extract the week number
BPRSL <-  BPRSL %>% mutate(week = as.integer(substr(weeks, 5,5)))

# A glimpse at the BPRSL data
glimpse(BPRSL)
str(BPRS)

#We now have a dataset with 360 observations and 5 variables -> long form

# and the same to RATS

# Convert categorical data to factors - RATS
RATS$ID <- factor(RATS$ID)
RATS$Group <- factor(RATS$Group)

# Convert data to long form and extract the time

RATSL <- RATS %>%
  gather(key = WD, value = Weight, -ID, -Group) %>%
  mutate(Time = as.integer(substr(WD, 3, 4))) 

# A glimpse at the data
glimpse(RATSL)
str(RATSL)


names(BPRS)
names(RATS)

#In the long form time is in one column and in  wide time variables are in different columns

# write formatted sets to csv files
write.csv(RATSL, "data/rats_long.csv")
write.csv(BPRSL, "data/bprs_long.csv")


