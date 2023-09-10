# GOF- Good of Fit Test---------------------------------------------
# Confirm the categorical variable satisfies the distribution
dices <- c(rep(1, 50), rep(2, 50), rep(3, 80), 
          rep(4, 70), rep(5, 200), rep(6, 150))

l = length(dices)
freq = table(dices)
probs = rep(1/6, 6)
# plot
barplot(table(dices))
barplot(table(dices), cex.axis = 1.5, cex.names = 1.5, cex.lab = 1.5,
        main = '600 times', xlab = 'Number', ylab = 'Frequency',col = 2:7)
abline(h = 100, lty = 2, col = 'red', lwd = 2)

chisq.test(freq)
chisq.test(freq, p = probs)
chisq.test(freq, p = c(0.08, 0.08, 0.15, 0.12, 0.33, 0.24))

# Independent Test-------------------------------------------------
# Confirm two categorical variables are independent ?
path = "https://goo.gl/j6lRXD"
df <- read.csv(path)

head(df)
summary(df)
str(df)

# contingency table: a two-way frequency table
ct = table(treatment = df$treatment, improvement = df$improvement)
chisq.test(ct, correct = FALSE)# Descrete Correction
dim(df)

# Homogeneity Test--------------------------------------------------
# Does two samples have the same distribution on a variable?
smoke <- c(rep(0,35), rep(1,15))
drink <- c(rep(0, 47), rep(1, 3))
smoke_drink_count <- rbind(table(smoke), table(drink))
row.names(smoke_drink_count) <- c('smoke', 'drink')
smoke_drink_count
chisq.test(smoke_drink_count, correct = FALSE)

