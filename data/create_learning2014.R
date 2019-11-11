#Mette Nissen, 11.11.19 Data Wrangling

#access dplyr library
library(dplyr)
#Reading data
data <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)

#Structure and dimensions of data 

str(data)

#Creating analysis dataset
analysis_dataset <- select(data, one_of(c("gender", "Age", "Attitude", "Points")))
str(analysis_dataset)

Straq <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")
Surfq <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
Deepq <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")

# select the columns related to deep learning and create column 'Deep' by averaging
deep_columns <- select(data, one_of(Deepq))
analysis_dataset$Deep <- rowMeans(deep_columns)

# select the columns related to surface learning and create column 'Surf' by averaging
surface_columns <- select(data, one_of(Surfq))
analysis_dataset$Surf <- rowMeans(surface_columns)

# select the columns related to Stategic learning and create column 'Stra' by averaging
stra_columns <- select(data, one_of(Straq))
analysis_dataset$Stra <- rowMeans(stra_columns)




# Select rows where points are greater than 0
analysis_dataset <- filter(analysis_dataset, Points > 0)

?write.csv 

#Write csv

write.csv(analysis_dataset, "learing_2019.csv")
str(learnin_2019.csv)
