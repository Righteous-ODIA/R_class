# ------- Import tidyverse library ---------
# for manipulating dataset, just like pandas does in python
library(tidyverse)

# ------- Load Dataset into R ---------
my_data <- read.csv("C:/Users/mishop/Downloads/SuperMarket Analysis.csv")

# ----- Exploration DataAnalysis in R using tidyverse and R(Base) functions ------

# ----- Initial Exploration ------
head(my_data)
View(my_data)   
dim(my_data)     # the numbers of Rows and Columns, similar to shape in python pandas
str(my_data)     # similar to info in python pandas
summary(my_data)     # this summarizes the data_set, similar to describe in python pandas
glimpse(my_data)     # tidyverse version of info() and .dtypes in python pandas, does thesame thing as "str" in R(Base)
colnames(my_data)    # tidyverse version of .columns in python and names() in R(Base)
rownames(my_data)    # .index in python pandas
nrow(my_data)        # len() in python

# ----- Data Quality ------
sum(is.na(my_data))     # check for missing values
# my_data %>%
#   summarise(total_missing = sum(is.na(.)))
sum(duplicated(my_data))    # check for duplicate rows
unique(my_data$Gender)      # check for unique values in gender column
group_by(my_data$Gender)  # Value Count

# ------ Selecting Column ------
gender_col <- my_data[, "Gender"]
View(gender_col)

gender <- my_data$Gender
View(gender)

gender_price <- my_data[, c("Gender", "Sales")]
View(gender_price)


# ------ filter -------
male_above_30 <- filter(my_data, Gender == "Male" & Rating >= 5)
View(male_above_30)

# ------ mutate ------
new_unit_price <- mutate(my_data, New_Unit.price = Unit.price + 5)
View(new_unit_price)

# ------ Visualization ------
ggplot(my_data, aes(x=Gender)) +
  geom_bar()

ggplot(my_data, aes(x=Sales)) +
  geom_histogram()

ggplot(my_data, aes(x=Gender, y=Sales)) +
  geom_boxplot()

ggplot(my_data, aes(x=City, y=Sales)) +
  geom_boxplot()

ggplot(my_data, aes(x = Sales, y = Rating)) +
  geom_point()
