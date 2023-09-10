getwd()
setwd("C:\\Users\\user\\Documents\\R_A_Z\\Advanced")
getwd()

path = "P3-Future-500-The-Dataset.csv"
fin <- read.csv(path)
fin <- read.csv(path, na.strings =c(""))
head(fin, 10)
tail(fin, 10)
str(fin)
summary(fin)

fin$ID <- factor(fin$ID)
fin$Inception <- factor(fin$Inception)
str(fin)

# Factor Variable Trap
a <- c("12", "13", "14", "12", "12")
a
typeof(a)
b <- as.numeric(a)
b
typeof(b)
# Converting into Numerics For Factors:
z <- factor(c("12", "13", "14", "12", "12"))
z
typeof(z)
y <- as.numeric(z)
y
typeof(y)
# ----- Correct Way
x <- as.numeric(as.character(z))
x
typeof(x)

# FVT
head(fin)
str(fin)

for (x in names(fin)){
  print(x)
}

# sub and gsub
fin$Expenses <- gsub(" Dollars", "", fin$Expenses)
fin$Expenses <- gsub(",", "", fin$Expenses)
head(fin)
str(fin)

fin$Revenue <- gsub("\\$", "", fin$Revenue)
fin$Revenue <- gsub(",", "", fin$Revenue)
head(fin)
str(fin)

fin$Growth <- gsub("%", "", fin$Growth)
head(fin)
str(fin)

fin$Expenses <- as.numeric(fin$Expenses)
fin$Revenue <- as.numeric(fin$Revenue)
fin$Growth <- as.numeric(fin$Growth)
str(fin)
summary(fin)

# -------------- Dealing With Miss Data
# path = "P3-Future-500-The-Dataset.csv"
# fin <- read.csv(path, na.strings = =c(""))
head(fin, 14)
fin[c(14, 17),]
fin[!complete.cases(fin),]
str(fin)

fin[fin$Revenue == 9746272,]
which(fin$Revenue == 9746272)
?which
fin[which(fin$Revenue == 9746272),]

head(fin)
fin[fin$Employees==45,]
fin[which(fin$Employees==45),]

# Filtering: using is.na() for missing data
fin$Expenses == NA
fin[fin$Expenses == NA,]

# removing
fin_backup <- fin
fin[!complete.cases(fin),]
fin[!is.na(fin$Industry),] #opposite

fin <- fin[!is.na(fin$Industry),]
#rownames(fin) <- 1:nrow(fin)
rownames(fin) <- NULL

# Replacing Missing
fin[!complete.cases(fin),]

med_empl_retail <- median(fin[fin$Industry=="Retail","Employees"],
                          na.rm=TRUE)
med_empl_retail

fin[is.na(fin$Employees) & fin$Industry=="Retail",]
fin[is.na(fin$Employees) & fin$Industry=="Retail","Employees"] <- med_empl_retail

#check
fin[3,]

med_empl_finserv <- medium(fin[fin$Industry])
