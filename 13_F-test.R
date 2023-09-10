# Check two independent samples varience different. 
score_A <- c(rep(70,5), rep(75,10), rep(80,20), rep(85,20),
             rep(90,20), rep(95,20),rep(100,5))[sample(1:100, 100)]

score_B <- c(rep(70,25), rep(75,25), rep(80,20), rep(85,10),
             rep(90,15), rep(95,5))[sample(1:100, 100)]

mean(score_A)
mean(score_B)

var(score_A)
var(score_B)

length(score_A)
length(score_B)

# F-test statistic
var(score_A)/var(score_B)

var.test(score_A, score_B)
var.test(score_A, score_B, alternative = 'greater')

# Population has same var=> two sample t-test
t.test(score_A, score_B, alternative = 'two.sided', var.equal = TRUE)
