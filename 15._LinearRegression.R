set.seed(2023)
price <- sample(seq(10, 500, 5), 50)
sales <- round(price*(-0.5) + 260 + rnorm(50, 0, 10))

plot(price, sales, pch = 19)
abline(a = 260, b = -0.5, lty =2, col ='red', lwd = 2)

# residual
for (i in 1:length(price)) {
  lines(c(price[i], price[i]), c(sales[i], -0.5*price[i]+260), col=1, lwd=2)
}

#
summary(reg_model)

# R^2 = 1 - RSS/TSS
# R^2: coefficient of ditermination => Model explanatory part
# RSS: sum of squares of residuals => Model not explanatory part
# TSS: total sum of squares


coef(summary(reg_model))
coef(reg_model)

plot(price, sales, pch=19)
points(price, coef(reg_model)[1] + price*coef(reg_model)[2], pch = 19,
       col = 'red', cex = 0.8)
