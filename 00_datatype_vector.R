# Numerics
n <- 2.2
# Integers
i <- 5
# Logical
t <- TRUE
f <- FALSE
# Characters
char <- "Hello World!"
# Checking Data Type Classes
class(n)
class(i)
class(t)
class(f)

# Vector ---------------------------------------
v1 <- c(1,2,3,4,5)
v2 <- c('U','S','A')
v3 <- c(TRUE,FALSE)
v4 <- c('A',1)
class(v1)
class(v2)
class(v3)
class(v4)
# Vector Names
temps <- c(72,71,68,73,69,75,71)
names(temps) <- c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')
temps

days <- c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')
temps2 <- c(1,2,3,4,5,6,7)
names(temps2) <- days
temps2

# Slicing and index
temps[3:5]
temps[c(3:5)]
temps[c(3,5)]
temps['Mon']
temps[c('Mon')]

# Selection
filter <- temps<70
filter

temps[filter]

