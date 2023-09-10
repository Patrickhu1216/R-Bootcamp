# Built-in R Features - Data Structures -----------------------
# seq(): Create sequences
# sort(): Sort a vector
# rev(): Reverse elements in object
# str(): Show the structure of an object
# append(): Merge objects together (works on vectors and lists)
# -------------------------------------------------------------

# seq(start,end,step size)
s <- seq(0, 100, by = 3)

v <- c(1,4,6,7,2,13,2)
sort(v)
sort(v,decreasing = TRUE)

v2 <- c(1,2,3,4,5)
rev(v2)

str(v)

append(v,v2)

sort(append(v,v2))

# Data Types
v <- c(1,2,3)
is.vector(v)

is.list(v)

as.list(v)

as.matrix(v)

# Apply--------------------------------------------------------------
# vector
v <- c(1,2,3,4,5)

# our custom function
addrand <- function(x){
  # Get a random number
  ran <-sample(x=1:10,1)
  
  # return x plus the random number
  return(x+ran)
}

# lapply() for vector
result <- lapply(v,addrand)
print(result)

# Anon func with lapply()
lapply(v, function(a){a+sample(x=1:10,1)})

# adds two to every element
lapply(v,function(x){x+2})

add_choice <- function(num,choice){
  return(num+choice)
}

add_choice(2,3)

# Uh oh! Forgot to add other arguments!
# lapply(v,add_choice)

# Nice!
lapp <- lapply(v,add_choice,choice=10)

# Nice! A vector returned
sapp <- sapply(v,add_choice,choice=10)

class(lapp) # a list
class(sapp) # vector of numerics

# sapply() limitations
# Checks for even numbers
even <- function(x) {
  return(x[(x %% 2 == 0)])
}

nums <- c(1,2,3,4,5)

sapp2 <- sapply(nums,even)
lapp2 <- lapply(nums,even)

class(lapp2) # a list
class(sapp2) # vector of numerics


# Other apply() type functions ---------------------------------
# apply --------------------------------------------------------
# Two dimensional matrix
M <- matrix(seq(1,16), 4, 4)
M

# apply min to rows
apply(M, 1, min)

# apply max to columns
apply(M, 2, max)

# 3 dimensional array
M <- array( seq(32), dim = c(4,4,2))
M
# Apply sum across each M[*, , ] - i.e Sum across 2nd and 3rd dimension
apply(M, 1, sum)

# Apply sum across each M[*, *, ] - i.e Sum across 3rd dimension
apply(M, c(1,2), sum)

# lapply
# sapply
# vapply
# mapply
# Map
# rapply
# tapply
