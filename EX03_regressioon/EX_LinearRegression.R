
# install.packages('corrgram',repos = 'http://cran.us.r-project.org')
# install.packages('corrplot',repos = 'http://cran.us.r-project.org')
install.packages('caTools')

# Exploratory Data Analysis ----------------------------------------------
library(ggplot2)
library(ggthemes)
library(dplyr)
library(corrplot)
library(corrgram)

getwd()
setwd("C:/Users/user/Documents/GitHub/R-Bootcamp/EX03_regressioon")
getwd()

# Read CSV, note the delimiter (sep)
df <- read.csv('student-mat.csv',sep=';')
str(df)
head(df)
summary(df)

# Check NA
any(is.na(df))
str(df)

# To factor
col2factor = c("school", "sex", "address", "famsize", "Pstatus", "Mjob", 
               "Fjob", "reason", "guardian", "schoolsup", "famsup", "paid",
               "activities", "nursery", "higher", "internet", "romantic")

for (col in col2factor) {
  df[,col] <- factor(df[,col])
}

str(df)

# Correlation and CorrPlots
# Grab only numeric columns
num.cols <- sapply(df, is.numeric)

# Filter to numeric columns for correlation
cor.data <- cor(df[,num.cols])

cor.data

corrplot(cor.data,method='color')

# high correlation between G1, G2, and G3 
# G1 - first period grade (numeric: from 0 to 20)
# G2 - second period grade (numeric: from 0 to 20)
# G3 - final grade (numeric: from 0 to 20, output target)

corrgram(df,order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt)

ggplot(df,aes(x=G3)) + 
  geom_histogram(bins=20,alpha=0.5,fill='blue') + 
  theme_minimal()

# Building a Model
# General Form:

# Import Library
library(caTools)
# Set a random see so your "random" results are the same as this notebook
set.seed(101) 

# Split up the sample, basically randomly assigns a booleans to a new column "sample"
sample <- sample.split(df$age, SplitRatio = 0.70) # SplitRatio = percent of sample==TRUE

# Training Data
train = subset(df, sample == TRUE)

# Testing Data
test = subset(df, sample == FALSE)

# Training our Model
model <- lm(G3 ~ .,train)
summary(model)

# Visualize our Model--------------------------------------



