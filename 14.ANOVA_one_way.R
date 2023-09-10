# ANOVA(Analysis of Variance)
# k: groups, n:totals
# SS_W: sum of square within group =>Mean Square MS_W = SS_W/n-k 
# SS_B: sum of square between group =>Mean Square MS_B = SS_B/k-1
# SS_T: SS_W + SS_B, total sum of square
#  => Using F-statistic, F = MS_B/MS_W
# df: (k-1), (n-k)

# H0: u1 = u2 = u3
# H1: u1 != u2 or u2 != u1 or u1 != u3

# eg: We have three salary samples, north, center and south.
north <- c(sample(seq(3, 5, 0.1), 10, replace=T), 
           sample(seq(5, 7, 0.1), 30, replace=T),
           sample(seq(7, 9, 0.1), 30, replace=T),
           sample(seq(9, 11, 0.1), 30, replace=T))

center <- c(sample(seq(3, 5, 0.1), 20, replace=T), 
            sample(seq(5, 7, 0.1), 30, replace=T),
            sample(seq(7, 9, 0.1), 30, replace=T),
            sample(seq(9, 11, 0.1), 20, replace=T))

south <- c(sample(seq(3, 5, 0.1), 30, replace=T), 
           sample(seq(5, 7, 0.1), 30, replace=T),
           sample(seq(7, 9, 0.1), 30, replace=T),
           sample(seq(9, 11, 0.1), 10, replace=T))

n = 100
df <- data.frame(salary = c(north, center, south),
                 place = c(rep('N', n), rep('C', n), rep('S', n)))

mean_salary <- aggregate(salary ~ place, data =df, FUN=mean)
mean_salary
mean_total <- round(mean(df$salary), 3)

rbind(mean_salary[order(mean_salary$salary, decreasing = T),],
      c('overall', mean_total ))


# SS_B
SS_B = sum(((mean_salary$salary - mean_total)^2)*n)
SS_B

# SS_W
SS_W = sum((north - mean(north))^2) + sum((center - mean(center))^2) + 
        sum((south - mean(south))^2)
SS_W

# ANOVA
oneway <- aov(salary ~ place, data = df)
summary(oneway)
oneway
