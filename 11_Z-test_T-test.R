install.packages('BSDA')

library('BSDA')

# Set seed
set.seed(0924)

# One Sample Example--------------------------------------------
# Generate male lengths Data
males <- rnorm(50, mean = 170, sd = 5)
males <- round(males)

# right: greater, left: less, two: two.sided
# Z-test
z.test(males, mu = 170, sigma.x = 5, alternative = 'two.sided')

# T-test
t.test(males, mu = 170, alternative = 'two.sided')
t.test(males, mu = 170, alternative = 'greater')
t.test(males, mu = 170, alternative = 'less')

# Two Sample Example--------------------------------------------
# Independent
score_A <- rnorm(100, mean = 70, sd = 20)
score_B <- rnorm(100, mean = 70, sd = 30)

score_filter <- function(s) {
  s <- round(s)
  if (s>100) {
    return (100)
  } 
  else if (s<0){
    return (0)
  }
  else {
    return (s)
  }
}

score_A = unlist(lapply(score_A, score_filter))
score_B = unlist(lapply(score_B, score_filter))

mean(score_A)
mean(score_B)

# H0: score_A = score_B
t.test(score_A, score_B, alternative = 'two.sided', var.equal = TRUE)
t.test(score_A, score_B, alternative = 'two.sided', var.equal = FALSE)

# H0: score_A >= score_B
t.test(score_A, score_B, alternative = 'greater', var.equal = TRUE)

# Paired Test -------------------------------------------------
# Dependency Paired T-test
mother_time <- sample(seq(2, 10, 0.5), 20, replace = TRUE)
father_time <- sample(seq(1, 6, 0.5), 20, replace = TRUE)

mean(mother_time)
mean(father_time)

# H0: mother_time = father_time
t.test(mother_time, father_time, paired = TRUE, 
       alternative = 'two.sided')

# H0: mother_time > father_time
t.test(mother_time, father_time, paired = TRUE, 
       alternative = 'greater')


time_diff <- mother_time - father_time
t.test(time_diff, mu = 0, alternative = 'greater')
