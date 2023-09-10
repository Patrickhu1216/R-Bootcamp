#-------------------- for loops

# vector
vec <- c(1,2,3,4,5)

for (temp_var in vec){
  print(temp_var)
}

for (i in 1:length(vec)){
  print(vec[i])
}

# list
li <- list(1,2,3,4,5)
for (temp_var in li){
  print(temp_var)
}

for (i in 1:length(li)){
  print(li[[i]]) # Remember to use double brackets!
}

# matrix
mat <- matrix(1:25,nrow=5)

for (num in mat){
  print(num)
}

for (row in 1:nrow(mat)){
  for (col in 1:ncol(mat)){
    print(paste('(', row,',',col,')=',mat[row,col]))
  }
}

#-------------------- while loops
x <- 0
while(x < 10){
  
  cat('x is currently: ',x)
  print(' x is still less than 10, adding 1 to x')
  
  # add one to x
  x <- x+1
}

x <- 0
while(x < 10){
  
  cat('x is currently: ',x)
  print(' x is still less than 10, adding 1 to x')
  
  # add one to x
  x <- x+1
  if(x==10){
    print("x is equal to 10!")
    print("I will also print, woohoo!")
  }
}

# break
x <- 0
while(x < 10){
  cat('x is currently: ',x)
  print(' x is still less than 10, adding 1 to x')
  
  # add one to x
  x <- x+1
  if(x==10){
    print("x is equal to 10!")
    break
    print("I will also print, woohoo!")
  }
}

# next
x <- 0
while(x < 10){
  cat('x is currently: ',x)
  print(' x is still less than 10, adding 1 to x')
  
  # add one to x
  x <- x+1
  if(x==6){
    print("x is equal to 6!")
    next
    print("I will also print, woohoo!")
  }
}