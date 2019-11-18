#Mette Nissen 15.9.2019 Exercise 3, data wrangling with student alcohol consumption.

stuDataPor <- read.csv("student-por.csv", header = TRUE, sep = ";")
stuDataMat <- read.csv("student-mat.csv", header = TRUE, sep = ";")
?read.csv


# access the dplyr library


install.packages("dplyr")
library(dplyr)


# common columns to use as identifiers
join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")

# join the two datasets by the selected identifiers
math_por <- inner_join(stuDataMat, stuDataPor, by = join_by, suffix = c(".stuDataMat", ".stuDataPor"))
# glimpse at the data
glimpse(math_por)

# the columns in the datasets which were not used for joining the data

# create a new data frame with only the joined columns
alc <- select(math_por, one_of(join_by))
alc

# the columns in the datasets which were not used for joining the data
notjoined_columns <- colnames(stuDataMat)[!colnames(stuDataMat) %in% join_by]

# print out the columns not used for joining
notjoined_columns

# Combining colums
for(column_name in notjoined_columns) {
  two_columns <- select(math_por, starts_with(column_name))
  first_column <- select(two_columns, 1)[[1]]
  
  if(is.numeric(first_column)) {
    alc[column_name] <- round(rowMeans(two_columns))
  } else {alc[column_name] <- first_column}
}

# glimpse at the new combined data
glimpse(alc)

# a new column alc_use by combining weekday and weekend alcohol use
alc <- mutate(alc, alc_use = (Dalc + Walc) / 2)

# a new logical column 'high_use'
alc <- mutate(alc, high_use = alc_use > 2)

glimpse(alc)

?write.csv
write.csv(alc, "alc.csv")
str("alc.csv")
